function validateEmail() {
    var email = document.getElementById('email').value;
    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
    if (!emailRegex.test(email)) {
        alert('请输入有效的邮箱地址！');
        return false; // 阻止表单提交
    }
    return true; // 允许表单提交
}
