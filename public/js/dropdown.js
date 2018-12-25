

$("#provincia").change(event => {
	$.get('localidad/${event.target.value}', function(res, sta) {
		$("#localidad").empty();
		res.forEach(element =>{
			$("#localidad").append('<option value=${res.id}> ${res.localidad} </option>');
			});	
	});
});