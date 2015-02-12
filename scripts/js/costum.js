function Login(e){

	var mailaddress = document.getElementById('loginMailAddress').value;
	var password = document.getElementById('loginPassword').value;

	alert("address: " + mailaddress + "    " + " pw: " + password);
	window.location = 'login.php?mailaddress=' + mailaddress + '&pwd='+ password;
};



function Register(e){

	var lastname = document.getElementById('regLastName').value;
	var firstname = document.getElementById('regFirstName').value;
	var street = document.getElementById('regStreet').value;
	var housenr = document.getElementById('regHouseNr').value;
	var postcode = document.getElementById('regPcode').value;
	var place = document.getElementById('regPlace').value;
	var regMailAdd = document.getElementById('regMailAddress').value;
	var regPw = document.getElementById('regPasswd').value;

	alert("lastname: " + lastname + " firstname: " + firstname + " street: " +street + " housenr: " + housenr + " postcode: " + postcode + " place: " + place + " mailaddress: " + regMailAdd + " password: " + regPw);

	window.location = 'registration.php?lastname=' + lastname + '&firstname='+firstname; // und so weiter
}


$ (document).on('click', '.addButton', function(e){
	var element = document.getElementByClass('addButton');
	var ele = e;
});
