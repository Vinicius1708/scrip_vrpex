local lang = {
  dmv = {
    police = {
	  check_desc = "Checar licença do jogador mais proximo.",
	  take_desc = "Tirar CNH do jogador mais proximo.",
	  ask = "Pedindo CNH...",
	  request = "Deseja mostrar sua licença ?",
	  request_hide = "Fechar CNH.",
	  confirm = "Tem certeza que deseja remover esta licença?",
	  license = "<em>Nome: </em>{1}<br /><em>Sobrenome: </em>{2}<br /><em>Idade: </em>{3}<br /><em>RG: </em>{4}<br /><em>Telefone: </em>{5}<br /><em>Data: </em>{6}",
	  no_license = "~r~Este jogador não possui licença!",
	  took_license = "~g~A licença foi removida.",
	  license_taken = "~r~Sua licença foi removida!"
    },
  },
  client = {
    locked = "~r~Trancado",
	failed = "Você falhou\nVocê acumulou {1} ~r~Pontos de Erro",
	passed = "Você passou\nVocê acumulou {1} ~r~Pontos de Erro",
	proceed = "~b~Você passou, agora você pode prosseguir para o teste de condução",
	try_again = "~r~Você falhou no teste, você pode tentar novamente outro dia",
	no_license = "~r~Você está dirigindo sem uma licença",
	interact = "Pressione ~INPUT_DETONATE~ para interagir com o ~y~NPC",
	welcome = "~b~Bem Vindo ao ~h~DETRAN",
	menu = {
	  obtain = "Obter uma CNH",
	  intro = "Introdução    GRATUITO",
	  theory = "Teste teórico    R$ 200,00",
	  practical = "Teste pratico    R$ 500,00",
	  mreturn = "Voltar",
	  mclose = "Fechar",
	},
	control = {
	  enabled = "~y~Controle de Velocidade: ~g~ativado\n~s~Velocidade Máxima {1}kmh",
	  disabled = "~y~Controle de Velocidade: ~r~desativado",
	  help = "Ajuste sua velocidade máxima com ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~",
	  speed = "Velocidade máxima ajustada para {1}kmh",
	  cant_leave = "Você não pode deixar o veículo durante o teste",
	  not_dirving = "Você precisa estar dirigindo para realizar esta ação",
	},
    pnotify = {
      speeding = "Você está acelerando! <b style='color:#B22222'>Diminua!</b><br /><br />Você está dirigindo em uma zona de <b style='color:#DAA520'>{1} km/h</b> !",
	  damaged = "O veículo foi <b style='color:#B22222'>danificado!</b><br /><br />Cuidado!",
	  area = "Area: ~y~{1}\n~s~Velocidade Máxima: ~y~{2} km/h\n~s~Pontos de Erro: ~y~{3}/{4}",
	},
  },
}

return lang