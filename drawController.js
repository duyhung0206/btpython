var currentX = currentY = 0;

$(document).mousemove(function (event) {
    currentX = event.pageX - 8;
    currentY = event.pageY - 16;
});

app.controller('drawController', function ($scope, $timeout, fileReader) {
    $scope.index = 1;
    $scope.points = [];
    $scope.createStarted = false;
    $scope.counter = 0;
    $scope.started = false;
    $scope.keyCode = "";
    $scope.timeDelay = 200;

    /*
    * color-picker
    * */
    var startColorDefault = 'blue';
    var otherColorDefault = 'red';
    $scope.color = '#263238';
    $scope.hoverColor = null;
    $scope.size = 15;
    $scope.element = {
        option: {
            start_color: '',
            other_color: ''
        },
        real: {
            start_color: startColorDefault,
            other_color: otherColorDefault
        }
    }
    $scope.$watch('color', function (newVal) {
        if ($scope.selectElement == 'start') {
            $scope.element.option.start_color = newVal;
        }
        if ($scope.selectElement == 'other') {
            $scope.element.option.other_color = newVal;
        }
    });

    $scope.setColor = function () {
        $scope.element.real.start_color = angular.copy($scope.element.option.start_color);
        $scope.element.real.other_color = angular.copy($scope.element.option.other_color);
    }

    $scope.getSimpleData = function () {
        $scope.clearAll();
        $scope.points = dataSample;
        $timeout(function () {
            var maxIndex = 0;
            $scope.points.forEach(function (element) {
                document.getElementById("point-" + element.index).style.left = element.positionX;
                document.getElementById("point-" + element.index).style.top = element.positionY;
                $timeout(function () {
                    dragElement(document.getElementById("point-" + element.index));
                }, 50);
                if (element.index == "start") {
                    $scope.createStarted = true;
                }
                if (element.index > maxIndex) {
                    maxIndex = element.index;
                }
                $scope.index = maxIndex + 1;
            });
        }, 50);
    }

    $scope.hideAll = function () {
        $scope.points.forEach(function (element) {
            element.hided = true;
        });
    }

    $scope.showAll = function () {
        $scope.points.forEach(function (element) {
            element.hided = false;
        });
    }

    $scope.addStartPoint = function () {
        if ($scope.createStarted == true) {
            return;
        }
        $scope.createStarted = true;
        $scope.points[0] = {
            index: 'start',
            ran: false,
            hided: false
        };
        $timeout(function () {
            dragElement(document.getElementById("point-start"));
            $scope.index++;
        }, 50)
    }
    $scope.removePoint = function (index, points) {
        if(points[index].index == 'start'){
            $scope.createStarted = false;
        }
        points.splice(index, 1);
    }
    $scope.addPoint = function () {
        $scope.points.push({
            index: $scope.index,
            ran: false,
            hided: false
        });
        $timeout(function () {
            dragElement(document.getElementById("point-" + $scope.index));
            if ($scope.keyCode === 104) {
                document.getElementById("point-" + $scope.index).style.left = currentX + "px";
                document.getElementById("point-" + $scope.index).style.top = currentY + "px";
                $scope.keyCode = null;
            }
            if ($scope.keyCode === 108) {
                document.getElementById("point-" + $scope.index).style.left = currentX + "px";
                document.getElementById("point-" + $scope.index).style.top = currentY + "px";
            }
            $scope.index++;
        }, 20);
    }


    $scope.run = function () {
        if (!$scope.started) {
            $scope.points.forEach(function (element) {
                element.hided = true;
            });
            $scope.started = true;
        }
        if ($scope.counter == $scope.points.length) {
            $timeout.cancel($scope.mytimeout);
            return;
        }
        $scope.points[$scope.counter].ran = true;
        $scope.points[$scope.counter].hided = false;
        $scope.counter++;
        $scope.mytimeout = $timeout($scope.run, $scope.timeDelay);
    }

    $scope.clearAll = function () {
        $scope.points = [];
        $scope.reset();
    }

    $scope.save = function () {
        $scope.dataSave = [];
        $scope.points.forEach(function (element) {
            element.positionX = document.getElementById("point-" + element.index).style.left;
            element.positionY = document.getElementById("point-" + element.index).style.top;
            $scope.dataSave.push(element);
        });
    }

    $scope.stop = function () {
        $timeout.cancel($scope.mytimeout);
    }

    $scope.reset = function () {
        $scope.points.forEach(function (element) {
            element.ran = false;
            element.hided = false;
        });
        $scope.counter = 0;
        $scope.started = 0;
    }

    $scope.lStart = false;
    $scope.timeDelaylAdd = 1000;
    $scope.keyPressed = function (e) {
        $scope.keyCode = e.which;
        /*key: h*/
        if (e.which === 104) {
            $scope.addPoint();
        }

        /*key: b*/
        if ($scope.keyCode === 98) {
            $scope.points.pop();
        }

        /*key: l*/
        if ($scope.keyCode === 108) {
            $scope.lStart = !$scope.lStart;
            $scope.lAddPoint();
        }
    };

    $scope.lAddPoint = function () {
        if ($scope.lStart == false) {
            $timeout.cancel($scope.mytimeoutladd);
            return;
        }
        $scope.addPoint();
        $scope.mytimeoutladd = $timeout($scope.lAddPoint, $scope.timeDelaylAdd);
    }

    /*
    * Add text
    * */
    var textDefault = {
        text: 'Helloworld',
        color: '#ff291d',
        fontSize: '14'
    }
    $scope.newText = angular.copy(textDefault);
    $scope.listText = [];
    $scope.addText = function () {
        $scope.listText.push(angular.copy($scope.newText));
    }

    /*
    * Upload file
    * */

    $scope.daw_bgimage = "../image/map.png";
    $scope.getFile = function () {
        $scope.progress = 0;
        fileReader.readAsDataUrl($scope.file, $scope)
                      .then(function(result) {
                          $scope.imageSrc = result;
                      });
    };

    $scope.setBackground = function () {
        if($scope.imageSrc){
            $scope.daw_bgimage = angular.copy($scope.imageSrc);
        }
    }
});

