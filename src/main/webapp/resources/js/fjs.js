$(document).ready(function() {
	$("#register").validate({
		rules : {
			userName : "required",
			email : {
				required : true,
				email : true
			},
			userName : "required",
			password : {
				required: true,
				minlength : 6
			},
			confirmPassword : {
				required : true,
				minlength : 6,
				equalTo: "#password"
			}
		},
		messages : {
			userName : "Vui lòng nhập userName",
			email : {
				required : "Vui lòng nhập địa chỉ email!",
				email : "Địa chỉ ngắn vậy, chém gió ah?"
			},
			password:{
				required : "Vui lòng nhập pass word",
				minlength: "Mật khẩu phải ít nhất 6 kí tự"
			},
			confirmPassword : {
				required : "Vui lòng nhập lại password",
				minlength : "Mật khẩu phải ít nhất 6 kí tự",
				equalTo: "Mật khẩu không khớp!"
			}
		}
	});
	  $('#form-edit').validate({ // initialize the plugin
	    	rules : {
				firstName :{
					required : true,
					minlength : 3,
					maxlength :30
				},
				lastName : {
					required : true,
					minlength : 3,
					maxlength :30
				},
				phone : {
					required : true,
					minlength : 9,
					maxlength :13
				},
				description : {
					maxlength: 200
				}
			},
			message : {
				firstName :{
					required : "Enter First Name",
					minlength : "First Name at least 3 character",
					maxlength :"First Name max leng is 30 character"
				},
				lastName :{
					required : "Enter Last Name",
					minlength : "Last Name at least 3 character",
					maxlength :"Last Name max leng is 30 character"
				},
				phone :{
					required : "Enter your phone",
					minlength : "Phone at least 9 character",
					maxlength :"Phone max leng is 13 character"
				},
				description :{
					maxlength :"Description max length is 200 character"
				},
			},
			submitHandler : function() {
				$("#form-edit").submit();
			}
	    });
	  
		$("#formContent").validate({
			rules : {
				id : "required",
				title : {
					required : true,
					minlength : 10,
					maxlength :200
				},
				brief : {
					required : true,
					minlength : 30,
					maxlength :150
				},
				content : {
					required : true,
					minlength : 50,
					maxlength :1000
				},
			
			},
			messages : {
				id : "Vui lòng đăng nhập lại",
				title : {
					required : "Vui lòng nhập title!",
					minlength: "title phải ít nhất 10 kí tự",
					maxlength: "title  nhiều nhất 200 kí tự"
				},
				brief : {
					required : "Vui lòng nhập brief!",
					minlength: "title phải ít nhất 30 kí tự",
					maxlength: "title  nhiều nhất 150 kí tự"
				},
				content : {
					required : "Vui lòng nhập content!",
					minlength: "title phải ít nhất 50 kí tự",
					maxlength: "title  nhiều nhất 1000 kí tự"
				}
			}
		});
	
});
