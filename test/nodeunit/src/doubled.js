exports.calculate = function(num){
  if( typeof num === 'number')
    return num *2;
  else
    throw new Error("Expected a number");
}

exports.read = function () {
    var stdin = process.openStdin();
    
    stdin.on('data', function (chunk) {
      var num = parseFloat(chunk);
      var result = exports.calculate(num);
      console.log('doubled: ' + result);
      process.exit();
    });
}
