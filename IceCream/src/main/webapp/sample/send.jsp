<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.field {
	margin-bottom: 10px;
}

.field label {
	display: block;
	font-size: 12px;
	color: #777;
}

.field input {
	display: block;
	min-width: 250px;
	line-height: 1.5;
	font-size: 14px;
}

input[type="submit"] {
	display: block;
	padding: 6px 30px;
	font-size: 14px;
	background-color: #4460AA;
	color: #fff;
	border: none
}
</style>
</head>
<body>
	<form id="form">
		<div class="field">
			<label for="from_name">from_name</label> <input type="text"
				name="from_name" id="from_name">
		</div>
		<div class="field">
			<label for="to_name">to_name</label> <input type="text"
				name="to_name" id="to_name">
		</div>
		<div class="field">
			<label for="message">message</label> <input type="text"
				name="message" id="message">
		</div>
		<div class="field">
			<label for="reply_to">reply_to</label> <input type="text"
				name="reply_to" id="reply_to">
		</div>

		<input type="submit" id="button" value="Send Email">
	</form>

	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>

	<script type="text/javascript">
  emailjs.init('lF29ppJzXB2avZZ_M')
  const btn = document.getElementById('button');

document.getElementById('form')
 .addEventListener('submit', function(event) {
   event.preventDefault();

   btn.value = 'Sending...';

   const serviceID = 'default_service';
   const templateID = 'template_05ksbmh';

   emailjs.sendForm(serviceID, templateID, this)
    .then(() => {
      btn.value = 'Send Email';
      alert('Sent!');
    }, (err) => {
      btn.value = 'Send Email';
      alert(JSON.stringify(err));
    });
});
</script>

</body>
</html>