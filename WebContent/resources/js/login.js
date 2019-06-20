window.addEventListener("load", (e)=>{
	const btn=document.querySelector("#validate");
	const div=document.querySelector("#error");
	const btnPerfil=document.querySelector("#perfil");
	btn.addEventListener('click', ()=>{
		const usr=document.querySelector("#username");
		const psw=document.querySelector("#password");
		fetch("http://localhost:8080/Tarea2NC/login/validate", {
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
				div.innerHTML=`
					<p>Error<p>
				`
			}else{
				window.location.href = "http://localhost:8080/Tarea2NC/";
			}
		})
		.catch(error=>{
			console.log(error);
		})
	});
	btnPerfil.addEventListener("click", ()=>{
		console.log("click");
	});
});