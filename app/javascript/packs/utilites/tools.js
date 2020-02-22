// Add polifil useful function
String.prototype.padStart = function(len, pad = ' '){
    var str = this.toString();
    while(str.length < len) str = pad + str;
    return str;
}