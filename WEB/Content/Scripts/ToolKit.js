/// <reference path="easyui/jquery-1.11.1.js" />
//格式化JSON时间
function FormatJsonTime(date) {
    if (date != null) {
        var de = new Date(parseInt(date.replace("/Date(", "").replace(")/", "").split("+")[0]));
        var y = de.getFullYear();
        var m = de.getMonth() + 1;
        var d = de.getDate();
        var h = de.getHours();
        var mi = de.getMinutes();
        var s = de.getSeconds();
        return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d)+' '+(h<10?('0'+h):h)+':'+(mi<10?('0'+mi):mi)+':'+(s<10?('0'+s):s);
    }
    else {
        return "";
    }
}
function FormatJsonDate(date) {
    if (date != null) {
        var de = new Date(parseInt(date.replace("/Date(", "").replace(")/", "").split("+")[0]));
        var y = de.getFullYear();
        var m = de.getMonth() + 1;
        var d = de.getDate();
        return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
    }
    else {
        return "";
    }
}