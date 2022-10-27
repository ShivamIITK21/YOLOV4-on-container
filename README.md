# How to Use?
1). Download YOLOv4 weights from https://github.com/AlexeyAB/darknet/releases/download/darknet_yolo_v3_optimal/yolov4.weights  
2). Build the docker image: **sudo docker build . -t yolo:1**  
3). Provide xhost permissions **xhost +**  
4). Run YOLO real time detection **sudo docker run --name yolo -it -e DISPLAY=$DISPLAY -v /tmp/.X11-unix/:/tmp/.X11-unix --device /dev/video0 --gpus all --rm yolo:1 ./darknet detector demo cfg/coco.data cfg/yolov4.cfg yolov4.weights -c 0**  