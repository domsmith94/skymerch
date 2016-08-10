$(document).ready(function() {
	$("#btnSubmit").click(function(){
		var title = $("#title").val();
		var firstName = $("#firstName").val();
		var lastName = $("#lastName").val();
		var email = $("#email").val();
		var mobileNumber = $("#mobileNumber").val();
		var password = $("#password").val();
		var confirmPassword = $("#confirmPassword").val();
		
		if (password != confirmPassword) {
			alert("Passwords don't match");
		}
		alert(firstName + " is" );
	});

});