function DeliveryConfirm(orderId) {
    $.post("delivery_confirm", {id:orderId,status:5}, function(data){
        if(data=="ok"){
            alert("确认邮件发送成功！");
            window.location.reload();
        }
        else{
            alert("确认邮件发送失败！");
        }
    });
}
