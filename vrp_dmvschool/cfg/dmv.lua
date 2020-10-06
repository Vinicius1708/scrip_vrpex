cfg = {}

cfg.lang = "en"

cfg.dmv = {
  warn = false,
  peds = {
    {type=4, hash=0xc99f21c4, x=239.471, y=-1380.96, z=32.74176, h=137.6}
  },
  blip = {
    id = 408,
    colour = 4,
	size = 0.6,
    title = "Detran"
  },
  menu = {
    x = 0.1,
    y = 0.2,
    width = 0.2,
    height = 0.04,
    scale = 0.4,
    font = 0,
    menu_title = "Detran",
    menu_subtitle = "Tirar CNH",
    color_r = 0,
    color_g = 128,
    color_b = 255,
  }
}

cfg.speed = {
  mult = 3.6, -- 3.6 is kmh / 2.25 is mph (don't ask me why)
  control = { -- https://wiki.fivem.net/wiki/Controls
    toggle = 73, -- X
	up = 27, -- UP
	down = 173 -- DOWN
  },
  area = {
    {
      name = "Residencial",
	  limit = 50.0
	},
    {
      name = "Cidade",
	  limit = 80.0
	},
    {
      name = "Autoestrada",
	  limit = 120.0
	},
  }
}

cfg.intro = {
  {
    pos = {173.01181030273, -1391.4141845703, 29.408880233765},
    msg = "<b style='color:#1E90FF'>DETRAN</b> <br /><br />Teoria e prática são elementos importantes da instrução de direção.<br />Esta introdução cobrirá o básico e garantirá que você esteja preparado com informações e conhecimento suficientes para o seu teste. <br /> <br /> As informações de suas aulas teóricas combinadas com a experiência de sua aula prática são vitais para negociar as situações e dilemas. você enfrentará na estrada. <br /> <br /> Sente-se e aproveite o passeio enquanto começamos. É altamente recomendável que você preste atenção a cada detalhe, a maioria dessas questões pode estar presente em seu teste de teoria."
  },
  {
    pos = {-428.49026489258, -993.306640625, 46.008815765381},
    msg = "<b style='color:#1E90FF'>Acidentes, incidentes e preocupações ambientaisAcidentes, incidentes e preocupações ambientais </b> <br/> <br/> <b style='color:#87CEFA'> Dever de ceder </b> <br/> Todos os motoristas têm o dever obedecer às regras da estrada, a fim de evitar danos previsíveis aos outros. A falha em ceder o direito de passagem quando exigido por lei pode levar à responsabilidade por quaisquer acidentes resultantes. Quando você ouvir uma sirene chegando, você deve ceder ao veículo de emergência, basta estacionar à sua direita. <br /> Você deve sempre parar quando um oficial de trânsito lhe disser. <br/> <br/> <b style='color:#87CEFA'> Condução Agressiva </b> <br/> Um carro que põe em perigo ou é susceptível de pôr em perigo as pessoas ou a propriedade é considerada uma condução agressiva. <br/> No entanto, a condução agressiva, pode levar a acidentes trágicos. É muito mais sensato dirigir defensivamente e estar sempre atento ao risco potencial de acidentes. <br/> "
  },
  {
    pos = {-282.55557250977, -282.55557250977, 31.633310317993},
    msg = "<b style='color:#1E90FF'> Área Residencial </b> <br/> <br/> Mantenha uma velocidade apropriada - Nunca mais rápido que o limite indicado, mais lento se o tráfego for pesado. <br/> Mantenha-se centrado em sua pista Nunca dirija na área reservada para carros estacionados. <br /> <br /> Mantenha uma distância de segurança segura - pelo menos 1 comprimento de carro para cada 10 mph. <br /> <br /> O limite de velocidade em uma área residencial é de 50 km / h. <br /> "
  },
  {
    pos = {246.35220336914, -1204.3403320313, 43.669715881348},
    msg = "<b style='color:#1E90FF'>Áreas Construídas / Cidades <br /> <br /> O limite de 80 km / h geralmente se aplica a todo o tráfego em todas as estradas com iluminação pública, a menos que especificado de outra forma. <br /> Dirigindo em velocidades muito rápidas para o as condições da estrada e da condução podem ser perigosas. <br /> <br /> Você deve sempre reduzir sua velocidade quando: <br /> <br /> Compartilhando a estrada com pedestres <br /> & bull; Dirigir à noite, pois é mais difícil ver outros usuários de estrada <br /> As condições meteorológicas tornam mais seguro fazê-lo <br /> <br /> Lembre-se, grandes veículos e motocicletas precisam de uma distância maior para parar <br/>"
  },
  {
    pos = {-138.413, -2498.53, 52.2765},
    msg = "<b style='color:#1E90FF'>Estradas / Auto-estradas </ b> <br /> <br /> O tráfego nas auto-estradas normalmente viaja mais depressa do que noutras estradas, por isso tem menos tempo para reagir. <br /> É especialmente importante usar os seus sentidos mais cedo e parecer muito mais adiante do que você faria em outras estradas. <br /> <br /> Verifique o tráfego na rodovia e combine sua velocidade para se ajustar com segurança ao fluxo de tráfego na faixa da esquerda. <br /> <br /> limite de velocidade em uma área de autoestrada / auto-estrada é de 120 km / h. <br /> "
  },
  {
    pos = {187.465, -1428.82, 43.9302},
    msg = "<b style='color:#1E90FF'>Álcool </ b> <br /> <br /> Beber enquanto dirige é muito perigoso, álcool e / ou drogas prejudicam seu julgamento. O julgamento prejudicado afeta como você reage aos sons e ao que vê. No entanto, o DMV permite uma certa quantidade de concentração de álcool para aqueles que dirigem com uma carteira de motorista válida. <br /> <br /> 0,08% é o limite legal para a concentração de álcool no sangue de um motorista (BAC) <br />"
  },
}

cfg.practical = {
  intro = {
	  "<b style='color:#1E90FF'>Instrutor do DETRAN:</b> <br /><br/> Use o <b style='color:#DAA520'> limitador de velocidade</b> para evitar <b style='color:#87CEFA'>acelerar muito</b>, ative isso durante o teste pressionando o botão <b style='color:#20B2AA'>X</b> no seu teclado.<br /><br /><b style='color:#87CEFA'>Avaliação:</b><br />- Tente não bater o veículo ou ultrapassar o limite de velocidade. Você receberá <b style='color:#A52A2A'>Pontos de Erro</b> sempre que você não seguir estas regras<br /><br />- Muitos <b style='color:#A52A2A'>Pontos de Erro</b> acumulados resultará em uma <b style='color:#A52A2A'>Falha</b> no teste",
	 "<b style='color:#1E90FF'>Instrutor do DETRAN:</b> <br /><br/> Estamos atualmente preparando seu veículo para o teste, enquanto isso você deve ler algumas linhas importantes. <br/> <br/> <b style='color:#87CEFA'> Limite de velocidade: </b> <br/> - Preste atenção no tráfego, e fique abaixo do limite <b style='color:#A52A2A'> velocidade </b> <br/> <br/> - Agora, você deve saber o básico, mas vamos tentar lembrá-lo sempre que você <b style='color:#DAA520'> entrar / sair </b> uma área com um limite de velocidade publicado",
  },
  max_errors = 5,
  spawn = {249.40971374512,-1407.2303466797,30.409454345703},
  steps = {
    {
	  pos = {255.13990783691,-1400.7319335938,29.5374584198},
	  msg = "Vá para o próximo ponto!"
	},
    {
	  pos = {271.8747253418,-1370.5744628906,30.932783126831},
	  msg = "Vá para o próximo ponto!"
	},
    {
	  pos = {234.90780639648,-1345.3854980469, 29.542045593262},
	  stop = "Faça uma rápida parada para pedestres em cruzamentos",
	  msg = "Ótimo! vamos continuar andando!"
	},
    {
	  pos = {217.82102966309,-1410.5201416016,28.292112350464},
	  stop = "Faça uma parada rápida e observe sua ESQUERDA antes de entrar no trânsito",
	  msg = "Ótimo! Agora pegue a direita e escolha sua pista",
	  area = 2
	},
    {
	  pos = {178.55052185059,-1401.7551269531,27.725154876709},
	  msg = "Olhe os semáforos!"
	},
    {
	  pos = {113.16044616699,-1365.2762451172,27.725179672241}
	},
    {
	  pos = {-73.542953491211,-1364.3355712891,27.789325714111},
	  msg = "Certifique-se de parar para dar passagem a outros veículos!"
	},
    {
	  pos = {-355.14373779297,-1420.2822265625,27.868143081665}
	},
    {
	  pos = {-439.14846801758,-1417.1004638672,27.704095840454}
	},
    {
	  pos = {-453.79092407227,-1444.7265625,27.665870666504},
	  msg = "Hora de pegar a estrada, assista sua velocidade e não colida !",
	  area = 3
	},
    {
	  pos = {-463.23712158203,-1592.1785888672,37.519771575928}
	},
    {
	  pos = {-900.64721679688,-1986.2814941406,26.109502792358}
	},
    {
	  pos = {1225.7598876953,-1948.7922363281,38.718940734863},
	  msg = "Entrando na cidade, observe sua velocidade!"
	},
    {
	  pos = {1163.6030273438,-1841.7713623047,35.679168701172},
	  msg = "Bom trabalho, agora vamos voltar!",
	  area = 2
	},
    {
	  pos = {235.28327941895,-1398.3292236328,28.921098709106},
	}
  }
}

return cfg