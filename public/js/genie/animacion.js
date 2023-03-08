
console.clear();

gsap.set('.wrapper',{xPercent:0,yPercent:0})


var boxWidth = 200,
    totalWidth = boxWidth * 7 ,  // * n of boxes + diff textBox
    time = 1,
    no01 = document.querySelectorAll("#no01 .box"),
    dirFromLeft = "+=" + totalWidth,
    dirFromRight = "-=" + totalWidth;

var mod = gsap.utils.wrap(0, totalWidth);

gsap.set(no01, {
  x:function(i) {
    return i * boxWidth;
  }
});

var action = gsap.timeline()
.to(no01,  {
  x: "+=200",
  modifiers: {
    x: x => mod(parseFloat(x)) + "px"
  },
  duration:time, ease: "power4",
  repeatRefresh: true,
  repeatDelay: 1,
  repeat:-1,
});


