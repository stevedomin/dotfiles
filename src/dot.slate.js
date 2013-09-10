// Create Operations
var pushRight = slate.operation("push", {
  "direction" : "right",
  "style" : "bar-resize:screenSizeX/2"
});

var pushLeft = slate.operation("push", {
  "direction" : "left",
  "style" : "bar-resize:screenSizeX/2"
});

// Half left
slate.bind("left:ctrl,cmd,alt", function(win) {
  // here win is a reference to the currently focused window
  win.doOperation(pushLeft);
});

// Half right
slate.bind("right:ctrl,cmd,alt", function(win) {
  // here win is a reference to the currently focused window
  win.doOperation(pushRight);
});

var grid = slate.operation("grid", {
  "grids" : {
    "2560x1440" : {
      "width" : 9,
      "height" : 5
    },
    "1440x900" : {
      "width" : 9,
      "height" : 5
    }
  },
  "padding" : 10
});
slate.bind("1:ctrl", grid);