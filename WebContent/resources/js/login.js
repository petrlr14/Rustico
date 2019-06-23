const log=(pageContext)=>{
	const usr=document.querySelector("#username");
	const psw=document.querySelector("#password");
	console.log(pageContext);
	fetch(`${pageContext}/validate`, {
		method:"POST",
		body:JSON.stringify({username:usr.value, password:psw.value}),
		headers:{
			    'Content-Type': 'application/json'
		 }
	})
	.then(response=>{
		return response.json();
	})
	.then(json=>{
		if(!json.valid){
			$("#error-container").show("slow").fadeTo(2000, 500).slideUp(500, function() {
			      $("#error-container").slideUp(500);
			});
		}else{
			window.location.href = `${pageContext}/sucursal`;
		}
	})
	.catch(error=>{
		console.log(error);
	})
}