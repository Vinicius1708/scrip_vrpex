let openCaseID;
let openCaseAuthor;
let supportPermissions;
let loadingscreen = false;
let loadingscreen_delay = 0;

/*var hoje = new Date(),
    diaMesAno = (hoje.getMonth()+1)+'/'+hoje.getDate()+'/'+hoje.getFullYear(),
    hora = hoje.getHours() + ":" + hoje.getMinutes() + ":" + hoje.getSeconds(),
    horaTicket = diaMesAno+' | '+hora;
document.getElementById("horaticket").innerHTML = horaTicket;*/

function timeConverter(UNIX_timestamp){
  var a = new Date(UNIX_timestamp * 1000);
  var months = ['Jan','Feb','Mar','Apr','May','Jun','Jul','Aug','Sep','Oct','Nov','Dec'];
  var year = a.getFullYear();
  var month = a.getMonth();

  var date = a.getDate();
  var hour = a.getHours();
  var min = a.getMinutes();
  var sec = a.getSeconds();

  if(month < 10) {
  	month = "0" + month;
  }

  if (hour < 10) {
  	hour = "0" + hour;
  }

  if (min < 10) {
  	min = "0" + min;
  }

  if (sec < 10) {
  	sec = "0" + sec;
  }

  var time = date + '/' + month + '/' + year + ' às ' + hour + 'h' + min + 'min';
  return time;
}

$(document).ready(function () {
	setTheme();
	window.addEventListener('message', function (event) {
		var item = event.data;
		$('*').scrollTop(0);
		if (item.show == true) {
			open();
			openMyCases();
		}
		if (item.show == false) {
			close();
		}
		if (item.options) {
			if (item.options.supportPermissions == true) {
				supportPermissions = item.options.supportPermissions;
				$("#btnSupportCases").css("display", "block");
			} else {
				supportPermissions = false;
				$("#btnSupportCases").css("display", "none");
			}
		}
		if (item.showMyCases) {
			$(".nav-item").attr("class", "nav-item");
			$("#btnMyCases").attr("class", "nav-item active");
			$("#my-cases-container").empty();
			if (item.cases.length > 0) {
				item.cases.forEach(element => {
					let currentStauts;
					if (element.status == 1) {
						currentStauts = "Aberto";
					} else {
						currentStauts = "Fechado";
					}
					if (element.title.length > 60) {
						element.title = element.title.substr(0, 60) + ' ...';
					}
					$("#my-cases-container").append(`
						<div class="case flex" onclick="openCase(${element.id})">
							<p>#${element.id}</p>
							<p>${element.title}</p>
							<p>Status: ${currentStauts}</p>
						</div>
					`);
				});
			} else {
				$("#my-cases-container").append(`
					<h3 class="cases-empty">Sem tickets</h3>
				`);
			}
			setTimeout(function () {
				$("#my-cases").css("display", "block");
				$("#support-cases").css("display", "none");
				$("#new-case").css("display", "none");
				$("#show-case").css("display", "none");
				$("#loadingscreen").css("display", "none");
			}, 1000);
		}
		if (item.showSupportCases) {
			$(".nav-item").attr("class", "nav-item");
			$("#btnSupportCases").attr("class", "nav-item active");
			$("#support-cases-container").empty();
			if (item.cases.length > 0) {
				item.cases.forEach(element => {
					if (element.title.length > 60) {
						element.title = element.title.substr(0, 60) + ' ...';
					}
					$("#support-cases-container").append(`
						<div class="case flex" onclick="openCase(${element.id})">
							<p>#${element.id}</p>
							<p>${element.title}</p>
							<p>ID do Jogador: ${element.user_id}</p>
						</div>
					`);
				});
			} else {
				$("#support-cases-container").append(`
					<h3 class="cases-empty">Sem tickets</h3>
				`);
			}
			setTimeout(function () {
				$("#my-cases").css("display", "none");
				$("#support-cases").css("display", "block");
				$("#new-case").css("display", "none");
				$("#show-case").css("display", "none");
				$("#loadingscreen").css("display", "none");
			}, 1000);
		}
		if (item.openCase) {
			$(".nav-item").attr("class", "nav-item");
			if (item.case.title.length > 80) {
				$(".case-info #case-title").html(item.case.title.substr(0, 80) + ' ...');
			} else {
				$(".case-info #case-title").html(item.case.title);
			}
			$(".case-info #case-author-id span").html(item.case.user_id);
			$(".case-info #horaticket").html(timeConverter(item.case.createdAt));
			$(".case-info #case-message").html(item.case.message);
			$('#show-case').scrollTop(0);

			if (item.case.status == 1) {
				$(".caseOpen").css("display", "block");
				$(".caseClosed").css("display", "none");
			} else {
				$(".caseOpen").css("display", "none");
				$(".caseClosed").css("display", "block");
			}
			// CKEDITOR.instances.replyEditor.setData('');
			$("#replyEditor").val("");
			openCaseID = item.case.id;
			openCaseAuthor = item.case.user_id;
			if (item.replies) {
				$(".case-replies").empty();
				item.replies.forEach(element => {
					$(".case-replies").append(`
						<div class="reply">
							<p>Admin ID: ${element.user_id} - ${timeConverter(element.createdAt)}</p>
							<p>${element.message}</p>
						</div>
					`);
				});
			}
			if (supportPermissions == true) {
				$(".support-btn").css("display", "block");
			} else {
				$(".support-btn").css("display", "none");
			}
			setTimeout(function () {
				$("#my-cases").css("display", "none");
				$("#support-cases").css("display", "none");
				$("#new-case").css("display", "none");
				$("#show-case").css("display", "block");
				$("#loadingscreen").css("display", "none");
			}, 1000);
		}
	});
	document.onkeyup = function (data) {
		if (data.which == 27) {
			$.post('http://vrp_helpdesk/close', JSON.stringify({}));
		}
	};
	$(".btnClose").click(function () {
		$.post('http://vrp_helpdesk/close', JSON.stringify({}));
	});
});

function open() {
	$(".container").fadeIn();
}
function close() {
	$(".container").fadeOut();
	$("#my-cases").css("display", "none");
	$("#support-cases").css("display", "none");
	$("#new-case").css("display", "none");
	$("#show-case").css("display", "none");
}
function openMyCases() {
	openLoadingscreen();
	$.post('http://vrp_helpdesk/getCases', JSON.stringify({}));
}
function openSupportCases() {
	openLoadingscreen();
	$.post('http://vrp_helpdesk/getSupportCases', JSON.stringify({}));
}
function openNewCase() {
	$("#my-cases").css("display", "none");
	$("#support-cases").css("display", "none");
	$("#new-case").css("display", "block");
	$("#show-case").css("display", "none");
	$(".nav-item").attr("class", "nav-item");
	$("#btnNewCase").attr("class", "nav-item active");
	// CKEDITOR.instances.newCaseEditor.setData('');
	$("#replyEditor").val("");
	$("#newCaseEditor").val("");
	$(".new-case-title").val("");
}
function openCase(id) {
	if (!id) {
		Swal.fire(
			'Ocorreu um erro!',
			'Não foi possível encontrar o ticket',
			'warning'
		);
		return;
	}
	openLoadingscreen();
	$.post('http://vrp_helpdesk/getCase', JSON.stringify({
		id: id
	}));
}
function openLoadingscreen() {
	$("#my-cases").css("display", "none");
	$("#support-cases").css("display", "none");
	$("#new-case").css("display", "none");
	$("#show-case").css("display", "none");
	$("#loadingscreen").css("display", "block");
	$(".nav-item").attr("class", "nav-item");
}
function setTheme() {
	if (configs.theme.primary_color && configs.theme.secondary_color) {
		let primary_color = `--primary-color: ${configs.theme.primary_color}; `;
		let secondary_color = `--secondary-color: ${configs.theme.secondary_color}; `;
		$(":root").attr("style", primary_color + secondary_color);
	}
}

function applyReply() {
	// let message = CKEDITOR.instances.replyEditor.getData();
	let message = $("#replyEditor").val();
	if (!message) {
		Swal.fire(
			'Ocorreu um erro!',
			'Por favor insira uma mensagem.',
			'warning'
		);
		return;
	}
	if (!openCaseID)
		return openMyCases();
	$.post('http://vrp_helpdesk/applyReply', JSON.stringify({
		message: message,
		case_id: openCaseID,
		replyid: openCaseAuthor
	}));
}

async function closeCase() {
	if (!openCaseID)
		return openMyCases();

	let confirmed = await btn_confirm("Fechar");
	if (confirmed) {
		$.post('http://vrp_helpdesk/closeCase', JSON.stringify({
			case_id: openCaseID
		}));
	}
}

async function deleteCase() {
	if (!openCaseID)
		return openMyCases();

	let confirmed = await btn_confirm("Excluir");
	if (confirmed) {
		$.post('http://vrp_helpdesk/deleteCase', JSON.stringify({
			case_id: openCaseID
		}));
	}
}

function gotoPlayer() {
	if (!openCaseID)
		return openMyCases();

	$.post('http://vrp_helpdesk/gotoPlayer', JSON.stringify({
		targetID: openCaseAuthor
	}));
}

function newCase() {
	let title = $(".new-case-title").val();
	// let message = CKEDITOR.instances.newCaseEditor.getData();
	let message = $("#newCaseEditor").val();
	$.post('http://vrp_helpdesk/newCase', JSON.stringify({
		title: title,
		message: message
	}));
	Swal.fire({
		text: 'Ticket enviado com Sucesso!',
		type: 'success'
	});
}

function btn_confirm(title) {
	return new Promise((resolve, reject) => {
		Swal.fire({
			title: title,
			text: "Tem certeza ? Esta ação não pode ser desfeita.",
			type: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: 'Confirmar',
			cancelButtonText: "Cancelar"
		}).then((result) => {
			if (result.value) {
				resolve(true);
			}
		})
	});
}

// function loadingscreen() {
// 	loadingscreen = true;
// 	loadingscreen_delay = 2000;
// }

// while (loadingscreen == true) {
// 	$("#loadingscreen").css("display", "block");
// 	if (loadingscreen_delay > 0) {
// 		setTimeout(function () {
// 			loadingscreen_delay = 0;
// 		}, loadingscreen_delay);
// 	}
// }