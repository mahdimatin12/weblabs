const squareElement = document.getElementById('square');
let angel = 0;

setInterval( () => {
    angel = (angel + 2) % 360;
    squareElement.style.transform = `rotate(${angel}deg)`
}, 1000/60);

