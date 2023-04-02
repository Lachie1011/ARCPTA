#!/usr/bin/env python3
import roslib
import sys
import cv2
import rospy
import detectron2
from std_msgs.msg import String
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from detectron2.utils.logger import setup_logger
setup_logger()

# import some common detectron2 utilities
from detectron2 import model_zoo
from detectron2.engine import DefaultPredictor
from detectron2.config import get_cfg
from detectron2.utils.visualizer import Visualizer
from detectron2.data import MetadataCatalog, DatasetCatalog


class Segmentation_Node:

  def __init__(self):
    # setting up model
    self.cfg = get_cfg()
    self.cfg.MODEL.DEVICE='cpu'
    self.cfg.merge_from_file(model_zoo.get_config_file("COCO-PanopticSegmentation/panoptic_fpn_R_101_3x.yaml"))
    self.cfg.MODEL.WEIGHTS = model_zoo.get_checkpoint_url("COCO-PanopticSegmentation/panoptic_fpn_R_101_3x.yaml")
    self.predictor = DefaultPredictor(self.cfg)
    
    # setting up ros pubs and subs
    self.image_pub = rospy.Publisher("segmented_out",Image)

    self.bridge = CvBridge()
    self.image_sub = rospy.Subscriber("/zed2i/zed_node/rgb/image_rect_color", Image,self.callback)  #"/d400/color/image_raw"

  def callback(self,data):
    try:
      cv_image = self.bridge.imgmsg_to_cv2(data, "bgr8")
    except CvBridgeError as e:
      print(e)

    # segmentation
    panoptic_seg, segments_info = self.predictor(cv_image)["panoptic_seg"]
    v = Visualizer(cv_image[:, :, ::-1], MetadataCatalog.get(self.cfg.DATASETS.TRAIN[0]), scale=1.2)
    out = v.draw_panoptic_seg_predictions(panoptic_seg.to("cpu"), segments_info)

    try:
      self.image_pub.publish(self.bridge.cv2_to_imgmsg(out.get_image()[:, :, ::-1], "bgr8"))
    except CvBridgeError as e:
      print(e)

def main(args):
  ic = Segmentation_Node()
  rospy.init_node('segmentation node', anonymous=True)
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()

if __name__ == '__main__':
    main(sys.argv)