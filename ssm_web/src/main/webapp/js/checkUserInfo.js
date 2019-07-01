/*添加用户信息校验*/
document.getElementsByTagName("form")[0].onsubmit = function () {

    return checkName() && checkAge() && checkQQ() && checkEmail()
};

document.getElementById("name").onblur = checkName;
document.getElementById("age").onblur = checkAge;
document.getElementById("qq").onblur = checkQQ;
document.getElementById("email").onblur = checkEmail;

function checkName() {

    /*姓名*/
    var name = document.getElementById("name").value;
    /*长度为2-5的所有字符*/
    var nameRegex = /^.{2,5}$/;
    var flag = nameRegex.test(name);
    if (!flag) {
        var msg1 = document.getElementById("msg1");
        msg1.innerHTML = "姓名长度应在2-5之间";
    }
    return flag;
}

function checkAge() {

    /*年龄*/
    var age = document.getElementById("age").value;
    /*年龄应为0-100之间,不能以0开头*/
    var ageRegex = /^(?:[1-9]?\d|100)$/;
    var flag = ageRegex.test(age);
    if (!flag) {
        var msg2 = document.getElementById("msg2");
        msg2.innerHTML = "年龄应为0-100之间,不能以0开头";
    }
    return flag;

}

function checkQQ() {

    /*QQ*/
    var qq = document.getElementById("qq").value;
    /*QQ号正则，5至12位*/
    var qqRegex = /^[1-9][0-9]{4,11}$/;
    var flag = qqRegex.test(qq);
    if (!flag) {
        var msg1 = document.getElementById("msg3");
        msg1.innerHTML = "QQ号应为5至12位";
    }
    return flag;

}

function checkEmail() {

    /*邮箱*/
    var email = document.getElementById("email").value;
    var emailRegex = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    var flag = emailRegex.test(email);
    if (!flag) {
        var msg1 = document.getElementById("msg4");
        msg1.innerHTML = "请输入正确的邮箱格式";
    }
    return flag;

}

