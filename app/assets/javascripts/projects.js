window.onload = function(){
	var clientHandle = document.getElementById('project_client_id');

	clientHandle.onchange = function(){

		var clientDetailsHandle = document.getElementById('clientDetails');
		var clientId 			= clientHandle.options[clientHandle.selectedIndex].value;
		var request             = new XMLHttpRequest();
		request.open('GET', '/clients/'+ clientId + '.json', true);
		request.onreadystatechange=function(){
			if((request.status === 200) && (request.readyState === 4)){
				console.log(request.responseText);
				var client = JSON.parse(request.responseText);
				var output = "Mobile"+ client.mobile + "-" + "ID: " + client.id;
				clientDetailsHandle.innerHTML = output;
			}
		}
		request.send();

	};

}

