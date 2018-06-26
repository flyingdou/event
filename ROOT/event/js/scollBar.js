var ScrollBar = {
       value: 0,
       maxValue: 100,
       step: 1,
       Initialize: function() {
           if (this.value > this.maxValue) {
               this.value = 100;
           }else if(this.maxValue > 100){
        	   this.maxValue = 100;
           }else if(this.value < 0){
        	   this.value = 0;
           }
           this.scrolling();
       },
       scrolling: function() {
           var valite = false;
           var currentValue;
           $("#scroll_Thumb").mousedown(function() {
               valite = true;
               $(document.body).mousemove(function(event) {
                   if (valite == false) return;
                   var changeX = event.clientX - 66;
                   console.log(changeX);
                   currentValue = event.clientX;
                   $("#scroll_Thumb").css("margin-left", currentValue + "px");
                   $("#scroll_Track").css("width", currentValue + 2 + "px");
                   if ((currentValue + 25) >= $("#scrollBar").width()) {
                       $("#scroll_Thumb").css("margin-left", $("#scrollBar").width() - 25 + "px");
                       $("#scroll_Track").css("width", $("#scrollBar").width() + 2 + "px");
                       ScrollBar.value = ScrollBar.maxValue;
                   } else if (currentValue <= 0) {
                       $("#scroll_Thumb").css("margin-left", "0px");
                       $("#scroll_Track").css("width", "0px");
                   } else {
                       ScrollBar.value = Math.round(100 * (currentValue / $("#scrollBar").width()));
                   }
               });
           });
           $(document.body).mouseup(function() {
               ScrollBar.value = Math.round(100 * (currentValue / $("#scrollBar").width()));
               valite = false;
               if (ScrollBar.value >= ScrollBar.maxValue) ScrollBar.value = ScrollBar.maxValue;
               if (ScrollBar.value <= 0) ScrollBar.value = 0;
           });
       }
   }