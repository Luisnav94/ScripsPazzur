-- =====================================================================
--  VBOT - TODOS LOS SCRIPTS UNIFICADOS  (version 62)
--  vBot 4.8 / OTCv8
--
--  - Cada seccion va en su propio bloque "do ... end".
--  - Todos estos scripts se colocan AL PRINCIPIO de cada pestana.
--
--  CAMBIOS v62
--   - Equipo Auto: 3 modos (PK -> PVP -> CAVE), cada uno con su propio set
--     de Ataque y Defensa. Se acabo cambiar items a mano al cambiar de modo.
--     PK y CAVE comparten los valores de vida y AMBOS ponen defensa si hay
--     un PK en pantalla. PVP usa sus propios valores. Quitado el modo WAR.
--     La ventana principal edita el set PK; el boton "Sets CAVE / PVP" abre
--     la ventana para editar esos dos (alternar con su boton).
--
--  CAMBIOS v61
--   - Corregido el error "attempt to perform arithmetic on global lastStep":
--     faltaba declarar lastStep (y wcTarget/lostAt) en el War Chase al
--     restaurarlo. Ya no salen errores en rojo.
--
--  CAMBIOS v60
--   - War Chase: en el MISMO piso ya NO activa follow (que estorbaba los
--     golpes). Solo chase + ataque + paso adelante, asi PEGA los hits. El
--     follow solo se usa para CRUZAR escaleras/gradas al cambiar de piso.
--
--  CAMBIOS v59
--   - War Chase: la gracia tras perder al enemigo bajo de 2.5s a 1.5s,
--     asi reacciona mas rapido cuando es muerte y no se pone "loquito".
--
--  CAMBIOS v58 (sobre el War Chase que seguia por todos lados)
--   - War Chase: al morir/matar/desaparecer el enemigo, suelta el objetivo
--     y ya NO regresa solo al ultimo lugar (sirve tambien en arena, donde
--     no sale mensaje de muerte).
--   - War Chase: adelanta 1 sqm hacia el enemigo para seguirlo de
--     inmediato, hacia cualquier direccion. (El seguimiento por pisos no
--     se toco.)
--
--  CAMBIOS v54
--   - War Chase: al dejar de atacar ya NO sigue moviendote como cavebot.
--     Ahora limpia bien el objetivo del follow cuando sueltas el ataque,
--     cambias a STOP o dejas de tener enemigo.
--
--  CAMBIOS v53
--   - Exani Hur: AHORA SI detecta la orilla. Antes el codigo de "orilla"
--     no se habia aplicado y por eso no bajaba. Orilla/lava -> down,
--     pared solida -> up. Automatico, con comillas.
--
--  CAMBIOS v52 (base restaurada de v47, que seguia bien)
--   - War Chase CON PISOS unificado con el motor del Auto Follow MC.
--   - War Chase CON PISOS unificado con el motor del Auto Follow MC: marca
--     al enemigo desde que atacas y lo sigue por gradas/escaleras igual.
--
--  CAMBIOS v47
--   - Follow MC: tras abrir una puerta vuelve a seguir casi al instante
--     (antes tardaba 5-8 s).
--   - Exani Hur: ya no alterna up/down al azar. Prueba primero el lado
--     correcto ("down" por defecto, configurable). Si sale "not possible"
--     prueba el otro lado; si sale "exhausted" reintenta el mismo. Asi
--     baja en los huecos de bajar.
--
--  CAMBIOS v46
--   - Follow MC: reacciona mucho mas rapido al cambiar de piso. Guarda tu
--     posicion cada 20 ms (antes podia perderla y arrancaba tarde, a 5-10
--     sqm). El seguimiento corre cada 50 ms en vez de 100.
--
--  CAMBIOS v45
--   - Follow MC: reintenta el seguimiento justo despues de cada cambio de
--     piso (al bajar/subir), con varios intentos escalonados, igual que el
--     script Sabuezo. Antes se quedaba quieto tras bajar porque no
--     reintentaba en el momento justo.
--
--  CAMBIOS v44
--   - Exani Hur auto: si topas con una PUERTA, la ABRE en vez de tirar
--     exani hur. Solo levita si enfrente hay una pared de verdad (no
--     puerta). Asi corres y las puertas se abren solas.
--   - Exani Hur auto: si el cliente no ve el otro piso, igual intenta
--     levitar (alterna up/down) en vez de quedarse quieto.
--
--  CAMBIOS v43
--   - Follow MC: ahora ABRE PUERTAS (por ID) en el camino y en la
--     transicion de piso. Baja alcantarillas (ya funcionaba). Mejor
--     persistencia tras bajar.
--
--  CAMBIOS v42
--   - Boost (exura boost): ya NO se lo tira a cualquiera ni a la friend
--     list. Solo a los de tu GUILD (emblema) y a los nombres que escribes
--     a mano en "Amigos por nombre" (ej. el poteador).
--   - Correccion: la deteccion de guild usaba un emblema que incluia a
--     jugadores sin relacion; ahora usa solo el emblema de aliado.
--
--  CAMBIOS v41
--   - Follow MC: ahora SI persigue despues de que el compañero sube/baja.
--     Recuerda la ultima posicion vista aunque este lejos, y al perderlo
--     camina a esa posicion y usa la escalera/alcantarilla/rope de ahi.
--
--  CAMBIOS v40
--   - Follow MC / War Chase: ahora reconoce huecos de pala (alcantarillas),
--     rope spots y escaleras por su ID (lista del Sabuezo), asi baja
--     alcantarillas y sube por cuerda. Necesitas pala y cuerda en mochila.
--
--  CAMBIOS v39
--   - Auto Follow MC / War Chase CON PISOS: ahora SI intenta subir
--     escaleras y gradas. Camina al sqm donde el compañero cambio de piso
--     con varios metodos (CaveBot.walkTo, autoWalk, player:autoWalk,
--     findPath) y al llegar pisa la grada o usa la escalera/rope/agujero.
--     Antes se quedaba quieto si no tenias cavebot cargado.
--
--  CAMBIOS v38
--   - Quitado el "Auto Haste" (utani hur) que no era funcional.
--   - Ventanas mas anchas y campos (SpinBox de %) mas grandes y
--     separados, para poder tocarlos y cambiar los numeros sin que se
--     edite el texto del hechizo. Sin cambiar ninguna funcion.
--
--  CAMBIOS v37
--   - NUEVO motor de follow con pisos (adaptado de un script que si sube
--     gradas): recuerda la ultima posicion vista y usa escalera/rope/pala/
--     grada/puerta en ese sqm. No lee mapas de otros pisos.
--   - "Auto Follow MC" (pestana Tools): sigue a una COLA de nombres; si
--     matan/pierde a uno, pasa al siguiente. Sube gradas/escaleras.
--   - War Chase "CON PISOS" ahora usa ese motor para seguir al enemigo.
--
--  CAMBIOS v36
--   - NUEVO "Auto Follow" (pestana Tools): prueba del follow del juego
--     para seguir a un compañero (base para el MC). Sirve para comprobar
--     si el follow sube/baja gradas en tu servidor.
--
--  CAMBIOS v35
--   - War Chase "CON PISOS" rehecho: ahora usa el FOLLOW del juego (como
--     el follow manual que sube gradas/escaleras). Tu atacas; al cambiar
--     el objetivo de piso el bot hace follow un momento para cruzarlo y
--     vuelve a atacar. Sin leer el mapa: no traba.
--
--  CAMBIOS v34
--   - War Chase: ya no traba el cliente. El seguimiento por pisos ya no
--     lee tiles de otros pisos en bucle (eso trababa 2-3 s), y el paso
--     usa findPath como mucho cada 400 ms (antes cada 100). Intervalo del
--     macro subido a 150 ms.
--
--  CAMBIOS v33
--   - War Chase "CON PISOS": ahora distingue GRADAS (se suben pisando:
--     camina al sqm) de ESCALERAS/AGUJEROS (se usan) y ROPE (usa cuerda).
--     Antes intentaba "usar" las gradas y por eso no subia.
--
--  CAMBIOS v32
--   - Rendimiento al loguear: los 26 macros ya no arrancan todos de
--     golpe. Ahora se reparten en el tiempo y esperan 1.5 s tras
--     loguear, para que no se trabe el cliente ni suba el ping al
--     encender el bot o entrar.
--
--  CAMBIOS v31
--   - War Chase (PvP): ahora tiene 3 modos en un boton (NORMAL -> CON
--     PISOS -> STOP). "CON PISOS" sigue al jugador que atacas cuando
--     cambia de piso (escaleras, rampas, rope, agujeros), con opcion de
--     no seguir si hay 2+ PKs en el piso destino.
--
--  CAMBIOS v30b
--   - Exani Hur: arreglado "attempt to call global 'levitate'". Faltaba
--     la funcion levitate al rehacer el archivo; ya esta.
--
--  CAMBIOS v30
--   - Exani Hur: el modo automatico volvio a funcionar. Ya no depende de
--     interceptar la funcion de caminar; detecta el choque cuando estas
--     quieto mirando una pared donde se puede levitar.
--
--  CAMBIOS v29
--   - Party Support: ayuda tambien a los de tu GUILD (por el emblema).
--     Ventanas mas chicas (caben sin achicar la pantalla): la principal
--     (a quien, vida, mana, seguridad) y "Hechizos y boost" (exura sio y
--     BOOST por turnos, ej: exura boost "{name}", recordando a quien ya
--     se lo dio).
--   - Exani Hur: ya no sale "exhausted" con utani tempo hur / utito
--     tempo: queda en cola, aparta el turno y se lanza apenas se pueda.
--
--  CAMBIOS v28
--   - NUEVO "Exani Hur" (pestana Tools): boton "Levitar" que elige solo
--     arriba o abajo segun el sqm de enfrente, botones ARRIBA/ABAJO en
--     Config, y modo automatico al chocar UNA vez contra una pared
--     (funciona con el keypad del celular).
--
--  CAMBIOS v27
--   - Alarma PK: aviso (sonido + Telegram) cuando se CONECTA alguno de
--     los nombres VIP que escribas. Funciona con la ventana VIP cerrada.
--   - Alarma PK: la configuracion (token, chat id, VIP, sonido, Probar)
--     ahora esta en una ventana con el boton "Config".
--
--  CAMBIOS v26
--   - Dynamic Lure: ignora mascotas e invocaciones, y los nombres de
--     "Monstruos a ignorar" sin importar el [Lvl.xx] (ej: Alebrije).
--     Si esta atacando a uno ignorado, cancela el ataque. "Alebrije"
--     se agrega solo a la lista. Attack Bot tampoco lo cuenta.
--
--  CAMBIOS v25
--   - Equipo Auto: nuevo Modo PVP con SUS PROPIOS sets (boton "Sets PvP"
--     en la ventana): Ataque PvP / Defensa PvP. Cambia SOLO por % de vida
--     (no reacciona a PKs).
--   - Deteccion de PK: ya no cuenta a los de tu misma guild (emblema
--     verde / miembro) ni a los de la lista de amigos de vBot.
--     Modo: WAR -> CAVE -> PK -> PVP.
--
--  CAMBIOS v24
--   - NUEVO "Exiva en minimapa" (pestana Tools): lee los mensajes de
--     exiva y pone una bandera en la zona aproximada del jugador.
--     Con varios exivas desde lugares distintos cruza las zonas.
--     Al cambiar de piso (caminando o con las flechas del minimapa)
--     la bandera se mueve sola al piso que muestra el minimapa y dice
--     en que piso esta realmente el jugador.
--
--  CAMBIOS v23
--   - Dynamic Lure: boton "Objetivo" en Config para elegir a quien
--     ataca de los monstruos pegados: el de MAS vida, el de MENOS vida
--     o el MAS cercano. No cambia de objetivo por menos de 10% de vida.
--   - Auto Haste: ahora tiene boton Config con su ventana (hechizo,
--     mana minima, pausa entre intentos) como los demas scripts.
--     No lanza en PZ (revisa el sqm ademas del icono) ni estando quieto
--     (opcion "Solo si me estoy moviendo", activada).
--
--  CAMBIOS v22
--   - NUEVO "Auto Haste" (pestana Tools): reemplaza al haste de
--     Conditions. Solo lanza si no tienes haste y respeta el exhaust de
--     soporte (2 s) junto con "Buff de ataque": ya no salen "You are
--     exhausted" por chocar haste + utito tempo.
--   - Buff de ataque: espera el exhaust de soporte antes de lanzar.
--
--  CAMBIOS v21
--   - NUEVO "Auto Comida" (pestana HP), reemplaza al Eat Food de vBot:
--     4 casillas de comida, come solo cuando hace falta, pausa tras
--     "You are full", no come con PK en pantalla, con vida baja ni justo
--     despues de una pocion. Apaga el Eat Food de vBot (opcional).
--
--  CAMBIOS v20
--   - Quitado el contador de pociones del Kina War Healer.
--   - Equipo Auto modo PK: no pone defensa por PK estando en PZ.
--   - Alarma PK: no avisa si TU tienes skull, y manda un solo mensaje
--     por PK (no se repite mientras siga en pantalla; vuelve a avisar
--     solo si se fue mas de 5 min y regresa).
--
--  CAMBIOS v19
--   - Equipo Auto: nuevo modo "PK" (boton Modo: WAR -> CAVE -> PK).
--     Usa los valores de HP / caida de WAR y ademas pone el set de
--     defensa si hay en pantalla un jugador con calavera blanca, roja
--     o negra (los de tu party se ignoran). Mantiene la defensa
--     mientras el PK siga en pantalla y "Mantener defensa" despues.
--   - NUEVO "Alarma PK" (pestana HP): sonido cada 3 s mientras haya
--     un PK en pantalla y aviso por Telegram (en el celular vibra y
--     enciende la pantalla). Boton "Probar" para comprobarlo.
--
--  CAMBIOS v18
--   - Cambio de set instantaneo otra vez: la devolucion de la pieza
--     a su mochila ahora espera a que termine el cambio (antes metia
--     movimientos en medio y lo hacia lento). Reintentos mas rapidos.
--   - Sin letras amarillas al cambiar: el estado de Anillo y Amuleto
--     solo avisa de problemas reales (item no encontrado, mochila llena).
--   - Quitado el aviso amarillo "[Equipo] No se pudo poner el ID".
--   - Si el servidor rechaza un movimiento (exhausted / not possible)
--     se reintenta al instante en vez de esperar.
--   - Equipo Auto y Set Pazzur reaccionan en el mismo momento en que
--     cambia la vida (no esperan al siguiente ciclo).
--   - Set de ataque rapido: el cambio del propio script ya no se
--     confunde con un cambio manual (eso bloqueaba piezas).
--   - Orden de cambio: armadura, casco, amuleto, piernas, botas,
--     anillo, ammo, escudo (Equipo Auto y Set Pazzur).
--   - Arreglado el set "a medias": durante el exhaust de pociones el
--     servidor solo guarda el ultimo movimiento. Ahora el set espera
--     a que termine el exhaust y entra todo junto; los healers
--     aguantan la pocion un instante (salvo vida <= 35%).
--   - Todas las piezas igual de rapidas: el servidor solo acepta 1
--     movimiento + 1 en espera. Ahora van 2 piezas en camino y apenas
--     el servidor confirma una sale la siguiente (antes armadura y
--     casco entraban rapido y el resto esperaba reintentos).
--   - Kina War Healer: contador de pociones debajo del panel (vida,
--     Inmortal, Recovery, Adrenalina). Cuenta tambien las de mochilas
--     cerradas (usa el total que manda el servidor al usar una).
--     Solo lee, no toca el healer.
--   - El cambio es UN solo movimiento directo (como antes): ya no
--     prueba equipar por hotkey ni desequipar primero, que hacia
--     "desequipa y equipa" y perdia tiempo.
--
--  CAMBIOS v17
--   - Equipo: la pieza que se quita al cambiar de set vuelve a la
--     MISMA mochila de donde salio su reemplazo (antes quedaba en
--     cualquier bp). Opcion "Devolver la pieza quitada a la mochila
--     del reemplazo" en Anillo y Amuleto, Equipo Auto y Set Pazzur
--     (es la misma opcion para los tres, viene activada).
--   - v15/v16: arreglado el error "trim (a nil value)" de Pazzur.
--
--  CAMBIOS v14  (scripts de Pazzur, con ventana como los demas)
--   - Main: "Auto Cast + Unban" (comando, intervalo, desbaneo de
--     espectadores con espera y opcion solo anonimos).
--   - Main: "Auto Bank" (deposita al activar/entrar y cada X min,
--     boton "Depositar ahora").
--   - Main: "Auto Stamina" (item, horas minimas, pausa entre usos).
--   - HP: "Set Pazzur (Atq/Def)" = Smart War HP + Set Defensa juntos.
--     Modo INTELIGENTE (HP / caida brusca) o SOLO DEFENSA.
--     Se pausa solo si "Equipo Auto" esta activo.
--   - HP: "Kina War Healer" (pociones especiales por rango con
--     prioridad corta + pocion de vida + ultimate/exana gran mort/
--     exana mort). Se pausa solo si "War Healer" esta activo.
--
--  CAMBIOS v13
--   - NUEVO "Attack Bot" (pestana Cave): hasta 6 ataques en orden de
--     prioridad. Tipos: Hechizo al objetivo, Area alrededor tuyo, Runa
--     al objetivo y Runa de area alrededor del objetivo. Con minimo de
--     monstruos, rango, cooldown y mana minima por fila.
--     Presets para Knight, Paladin, Sorcerer y Druid (boton "Cargar
--     preset" o "Aplicar perfil" en Main). No usa area si hay otros
--     jugadores en pantalla (opcional) y nunca en PZ.
--
--  CAMBIOS v12  (ahora sirve para TODAS las profesiones)
--   - NUEVO "Profesion" (arriba en Main): detecta Knight, Paladin,
--     Sorcerer, Druid o Monk (o la eliges a mano con "Cambiar").
--     "Aplicar perfil" pone los hechizos y opciones de esa profesion
--     en los scripts (pide confirmar con un segundo clic). No cambia
--     nada solo: tu configuracion queda igual hasta que lo pulses.
--   - War Healer: preset de curacion por profesion. Ya no choca con el
--     hechizo de curar amigos del Party Support.
--   - Utito Tempo pasa a "Buff de ataque": utito tempo (Knight) o
--     utito tempo san (Paladin). En magos se apaga al aplicar perfil.
--   - War Chase: Knight/Monk persiguen pegados; Paladin y magos
--     mantienen distancia y solo se acercan si el objetivo se aleja.
--   - Dynamic Lure: opcion "Seguir al monstruo (chase)". En automatico
--     solo Knight/Monk usan chase; los de distancia no se pegan.
--   - EK Support pasa a "Party Support": ademas de UH y pocion de
--     mana, cura amigos con hechizo (ej: exura sio para Druid).
--
--  CAMBIOS v11
--   - Dynamic Lure: ahora tiene ventana de Config (rango, cuantos mobs
--     para parar y para seguir, frenado del cavebot, monstruos a
--     ignorar, atacar sin cavebot...) con boton "Valores por defecto",
--     interruptor "Activar / Desactivar" y linea de estado (lureando,
--     peleando, grupo no alcanzable, cavebot apagado...).
--     OJO: el interruptor es nuevo, hay que activarlo una vez.
--
--  CAMBIOS v10
--   - War Healer: 2 pociones de vida (ej: la de lvl 1000 + la normal),
--     si se acaba una usa la otra. Mana minima por hechizo.
--     Anti-paralyze opcional. El estado dice que esta usando.
--   - Utito Tempo: ahora tiene ventana (palabras, duracion, mana minima,
--     solo en combate, pausa con HP bajo) y estado con cuenta atras.
--   - EK Support: los nombres de la lista se ayudan siempre (antes "Solo
--     party" los bloqueaba), party detectada tambien por escudo, runa por
--     hotkey si no esta en mochila abierta, y el estado dice por que no
--     cura (lejos, sin vision, tu HP bajo, mana no visible...).
--
--  CAMBIOS v9
--   - ELIMINADOS: Auto Cast, Auto Unban, Auto Deposit y Auto Stamina.
--   - Todas las ventanas rediseniadas: titulos por seccion, separadores,
--     textos de ayuda, etiquetas con ancho correcto (antes algunas se
--     cortaban o dejaban los SpinBox encima del texto).
--   - Cada ventana tiene ahora su boton "Activar / Desactivar" y una
--     linea de estado, sincronizados con el interruptor de la pestana.
--   - Panel de cada script en la pestana: interruptor + boton "Config"
--     + linea de estado, todos con el mismo formato.
--   - Encabezados en cada pestana para ubicar cada grupo de scripts.
--   - Anti-Push: el cambio de platinum/crystal ahora solo usa pilas de
--     menos de 100 (una pila de 100 se convertia a la moneda MAYOR).
--
--  INDICE
--   0. MAIN  - Profesion (perfil para todas las vocaciones)
--   1. MAIN  - Exercise Trainer (ventana + auto dummy)
--   2. MAIN  - Smart Imbue (ventana, + escudo y backpack)
--   3. HP    - War Healer (ventana)
--              Anillo y Amuleto (ventana, UNICO script de anillo/SSA)
--              Equipo Auto (ventana, set completo, modos WAR/CAVE/PK/PVP)
--   4. TOOLS - Buff de ataque (ventana), War Chase PvP (3 modos), Autosell
--   5. CAVE  - Dynamic Lure (ventana)
--   6. HP    - Party Support (UH, mana y hechizo para amigos)
--   7. TOOLS - Safe Anti-Push (monedas / comida)
--   8. CAVE  - Attack Bot (todas las profesiones)
--   9. MAIN  - PAZZUR: Auto Cast + Unban, Auto Bank, Auto Stamina
--  10. HP    - PAZZUR: Set Ataque/Defensa, Kina War Healer, Alarma PK
--  11. HP    - Auto Comida (4 casillas, reemplaza al Eat Food de vBot)
--  13. TOOLS - Exiva en el minimapa
--  14. TOOLS - Exani Hur (levitar arriba / abajo)
--  15. TOOLS - Auto Follow MC (cola de nombres, sube gradas/escaleras)
-- =====================================================================

-- ---------------------------------------------------------------------
-- Poner los scripts de este archivo arriba de cada pestana
-- ---------------------------------------------------------------------
local __pinned = {}
local __sec

local function startSection(tab)
  setDefaultTab(tab)
  local panel
  pcall(function()
    local probe = setupUI("Panel\n  height: 1")
    panel = probe:getParent()
    probe:destroy()
  end)
  return {tab = tab, panel = panel, before = panel and panel:getChildCount() or 0}
end

local function endSection(sec)
  if not sec or not sec.panel then return end
  pcall(function()
    local panel, list = sec.panel, {}
    for i = sec.before + 1, panel:getChildCount() do
      table.insert(list, panel:getChildByIndex(i))
    end
    local base = __pinned[sec.tab] or 0
    for i, w in ipairs(list) do
      panel:moveChildToIndex(w, base + i)
    end
    __pinned[sec.tab] = base + #list
  end)
end

-- ---------------------------------------------------------------------
-- ESTILOS Y AYUDAS DE INTERFAZ (comunes a todas las ventanas)
-- ---------------------------------------------------------------------
g_ui.loadUIFromString([[
VbTitle < Label
  color: #ffaa00
  text-auto-resize: true

VbHint < Label
  color: #999999
  text-wrap: true
  text-auto-resize: true

VbStatus < Label
  text-align: center
  color: #888888
  height: 16

VbScriptPanel < Panel
  height: 38

  Button
    id: setupBtn
    anchors.top: parent.top
    anchors.right: parent.right
    width: 48
    height: 20
    text: Config

  BotSwitch
    id: switch
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: setupBtn.left
    margin-right: 4
    height: 20

  Label
    id: status
    anchors.top: switch.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 2
    text-align: center
    color: #888888
    text: Inactivo
]])

local UIx = {}

-- Panel estandar en la pestana: interruptor + Config + estado
function UIx.scriptPanel(title)
  local p = setupUI("VbScriptPanel\n  height: 38")
  p.switch:setText(title)
  return p
end

function UIx.toggleWindow(win, beforeShow)
  if win:isVisible() then
    win:hide()
  else
    if beforeShow then beforeShow() end
    win:show()
    win:raise()
    win:focus()
  end
end

function UIx.setLabel(lbl, text, color)
  if not lbl then return end
  lbl:setText(text)
  lbl:setColor(color or "#888888")
end

-- Une el interruptor de la pestana con el boton de la ventana
function UIx.bindSwitch(conf, sw, btn, onChange)
  local function apply(v)
    conf.enabled = v and true or false
    sw:setOn(conf.enabled)
    if btn then btn:setText(conf.enabled and "Desactivar" or "Activar") end
    if onChange then onChange(conf.enabled) end
  end
  sw.onClick = function() apply(not conf.enabled) end
  if btn then btn.onClick = function() apply(not conf.enabled) end end
  apply(conf.enabled == true)
  return apply
end

-- Encabezado de grupo dentro de una pestana
function UIx.header(text)
  pcall(function()
    UI.Separator()
    local l = UI.Label(text)
    l:setColor("#ffaa00")
  end)
end

-- ---------------------------------------------------------------------
-- NUCLEO DE EQUIPO (lo usan "Anillo y Amuleto" y "Equipo Auto")
--  - Mueve desde mochilas abiertas.
--  - Si no esta en mochilas abiertas, equipa por hotkey del servidor
--    (busca en mochilas cerradas). NUNCA si el item ya esta puesto,
--    porque el servidor lo quitaria.
--  - Detecta cambios manuales (tu hotkey) y los respeta un tiempo.
-- ---------------------------------------------------------------------
-- ---------------------------------------------------------------------
-- ARRANQUE ESCALONADO DE MACROS
--  Al loguear o encender el bot, los 26 macros se disparaban TODOS en el
--  mismo instante y saturaban el cliente (tiron de 3-4 s, sube el ping).
--  Este envoltorio hace que cada macro:
--   1) espere un pequeno retraso distinto en su PRIMER disparo (se
--      reparten en ~2.5 s en vez de todos de golpe), y
--   2) salte su trabajo durante los primeros 1.5 s tras loguear, para
--      que el cliente termine de cargar el mapa y las criaturas antes.
-- ---------------------------------------------------------------------
do
  local realMacro = macro
  -- reloj fiable (ms): usa g_clock del cliente; si no, la global now
  local function clock()
    local ok, v = pcall(function() return g_clock.millis() end)
    if ok and type(v) == "number" then return v end
    if type(now) == "number" then return now end
    return 0
  end
  local bootAt = clock()
  local nextDelay = 0
  -- reiniciar el periodo de calma en cada (re)login
  pcall(function()
    if onGameStart then onGameStart(function() bootAt = clock() end) end
  end)
  macro = function(interval, a, b)
    local name, fn
    if type(a) == "function" then fn = a else name, fn = a, b end
    nextDelay = nextDelay + 40          -- cada macro arranca 40 ms despues
    local myDelay = nextDelay
    local started = false
    local function wrapped(...)
      local t = clock()
      -- calma inicial (1.2 s) + arranque escalonado propio de este macro,
      -- ambos contados desde el ultimo login (bootAt)
      if not started then
        if t - bootAt < 800 + myDelay then return end
        started = true
      end
      return fn(...)
    end
    if name ~= nil then return realMacro(interval, name, wrapped) end
    return realMacro(interval, wrapped)
  end
end

local Shared = {
  lastSelfPotion = -1000000,
  lastSelfHeal   = -1000000,   -- ultimo hechizo de curacion propio
  lastFriendHeal = -1000000,   -- ultimo hechizo de curar a un amigo
  friendWantAt   = -1000000,   -- un amigo necesita hechizo (Party Support)
  friendWantHp   = 100,
  -- Ultimo item usado por los scripts (para el contador de pociones)
  lastUseId      = 0,
  lastUseAt      = -1000000,
  -- Grupo de hechizos de SOPORTE (haste, utito tempo, charge...):
  -- comparten exhaust de 2 s. Si se lanzan juntos sale "You are exhausted".
  lastSupport    = -1000000,
  supportBlock   = 0,
  supportReserve = 0,   -- Exani Hur "aparta" el turno: los demas esperan
}
local SUPPORT_GAP = 2000
-- ignoreReserve = true solo lo usa quien hizo la reserva (Exani Hur)
function Shared.supportReady(ignoreReserve)
  if not ignoreReserve and now < (Shared.supportReserve or 0) then return false end
  return now - (Shared.lastSupport or -1000000) >= SUPPORT_GAP
     and now >= (Shared.supportBlock or 0)
end

-- Jugadores con calavera blanca, roja o negra en pantalla, SIN contar:
--  - los de tu party
--  - los de tu misma guild (emblema verde o de miembro de tu guild)
--  - los de la lista de amigos de vBot
-- Lo usan "Equipo Auto" (modo PK), "Alarma PK", Auto Comida, etc.
local PK_SKULLS = {[SkullWhite or 3] = true, [SkullRed or 4] = true, [SkullBlack or 5] = true}
local MY_GUILD_EMBLEMS = {[EmblemGreen or 1] = true, [EmblemMember or 4] = true}
function Shared.isFriendly(spec)
  local okp, party = pcall(function() return spec:isPartyMember() end)
  if okp and party then return true end
  local oke, em = pcall(function() return spec:getEmblem() end)
  if oke and MY_GUILD_EMBLEMS[em] then return true end
  local okf, fr = pcall(function() return isFriend and isFriend(spec:getName()) end)
  if okf and fr then return true end
  return false
end
function Shared.pkList()
  local res = {}
  for _, spec in ipairs(getSpectators()) do
    if spec:isPlayer() and not spec:isLocalPlayer() then
      local ok, sk = pcall(function() return spec:getSkull() end)
      if ok and PK_SKULLS[sk] and not Shared.isFriendly(spec) then
        table.insert(res, spec)
      end
    end
  end
  return res
end

-- Nombre "base" de un monstruo: sin lo que vaya entre corchetes.
-- "Alebrije [Lvl.37]" -> "alebrije"  (asi sirve para cualquier nivel)
function Shared.baseName(n)
  n = tostring(n or ""):lower():gsub("%s*%b[]", "")
  return (n:match("^%s*(.-)%s*$") or "")
end

-- Es una invocacion / mascota (tuya o de otro jugador)?
function Shared.isSummon(cr)
  local ok, t = pcall(function() return cr:getType() end)
  if not ok or type(t) ~= "number" then return false end
  return t == (CreatureTypeSummonOwn or 3) or t == (CreatureTypeSummonOther or 4)
end

-- Monstruos que NUNCA se atacan ni se cuentan: invocaciones/mascotas y
-- los nombres de "Monstruos a ignorar" del Dynamic Lure (sin importar el
-- [Lvl.xx] que tengan en el nombre).
local ignText, ignSet = nil, {}
function Shared.isIgnoredMob(cr)
  if Shared.isSummon(cr) then return true end
  local lc = storage.dynamicLureV9
  local txt = (type(lc) == "table" and lc.ignoreNames) or ""
  if txt ~= ignText then
    ignText, ignSet = txt, {}
    for name in txt:gmatch("[^,]+") do
      local n = Shared.baseName(name)
      if n ~= "" then ignSet[n] = true end
    end
  end
  return ignSet[Shared.baseName(cr:getName())] == true
end

-- Estoy en zona protegida (PZ)?
function Shared.inPz()
  local ok, res = pcall(function()
    if isInPz then return isInPz() end
    return player:hasState((PlayerStates and PlayerStates.Pz) or 16384)
  end)
  return ok and res == true
end

-- Tengo yo calavera blanca, roja o negra?
function Shared.iAmPk()
  local ok, sk = pcall(function() return player:getSkull() end)
  return ok and PK_SKULLS[sk] == true
end

-- Perfil de profesion (se llena en la seccion 0)
local Prof = {appliers = {}}
function Prof.register(fn) table.insert(Prof.appliers, fn) end
function Prof.get() return "knight" end
function Prof.isMelee() return true end
function Prof.name() return "Knight" end

local EquipCore = {}
do
  -- RETRY_MS: espera antes de reenviar si el servidor no respondio.
  -- Si el servidor RECHAZA el movimiento (exhausted / not possible)
  -- se reenvia al instante (ver onTextMessage mas abajo).
  local RETRY_MS, HOTKEY_RETRY, HOTKEY_MAX = 400, 800, 2
  local REJECT_RETRY = 60
  -- EXHAUST DE POCIONES: mientras dura, el servidor guarda SOLO el
  -- ultimo movimiento que le mandes y descarta los demas (por eso el
  -- set quedaba a medias). En ese tiempo se manda 1 pieza (la primera
  -- del orden) y al terminar el exhaust se mandan TODAS juntas.
  local POT_EXHAUST = 1000
  local waitingAt = -1000000

  -- COLA DE MOVIMIENTOS ("tuberia")
  --  El servidor ejecuta 1 movimiento y deja 1 en espera; si le mandas
  --  mas, los descarta (por eso armadura y casco entraban rapido y el
  --  resto tarde). Ahora hay como maximo 2 piezas en camino y, en el
  --  mismo instante en que el servidor confirma una, sale la siguiente.
  local MAX_INFLIGHT, INFLIGHT_MS = 2, 450
  local inflight = {}   -- slot -> {prevId, expire}
  local kicks = {}      -- funciones de los scripts para seguir al toque
  function EquipCore.addKick(fn) table.insert(kicks, fn) end

  local function inflightCount()
    local n = 0
    for slot, f in pairs(inflight) do
      local cur = getInventoryItem(slot)
      local cid = cur and cur:getId() or 0
      if cid ~= f.prevId or now > f.expire then
        inflight[slot] = nil          -- confirmado o perdido
      else
        n = n + 1
      end
    end
    return n
  end
  local function potBusy()
    return now - (Shared.lastSelfPotion or -1000000) < POT_EXHAUST
  end
  -- Los healers preguntan esto: si hay piezas esperando la ventana,
  -- aguantan la pocion un instante (salvo vida critica) para que el
  -- set entre completo.
  function EquipCore.holdPotion(hp)
    return now - waitingAt < 250 and (hp or 100) > 35
  end
  local HOTKEY_RESET = 30000
  local OPEN_DELAY, MAX_OPEN = 700, 10
  local OWN_MS = 1500   -- cambios dentro de este tiempo los hizo el script
  -- Para detectar cambios MANUALES se da mas margen: si el servidor
  -- tarda en confirmar, el cambio del script no se toma como manual
  -- (antes esa pieza quedaba bloqueada y el set de ataque iba lento).
  local TRACK_OWN_MS = 4000

  local alias, pending, hotkeyTries, nextTry = {}, {}, {}, {}
  local ownMove, lastSeen, manualUntil = {}, {}, {}
  local opener = {last = -1000000, tried = {}}
  local lastAction = -1000000   -- ultimo movimiento de equipo enviado

  local function isEquipped(cur, id)
    if not cur then return false end
    local cid = cur:getId()
    return cid == id or alias[id] == cid
  end
  EquipCore.isEquipped = isEquipped

  -- Llamar en cada ciclo por cada slot que maneja el script
  function EquipCore.track(slot, holdSec)
    local cur = getInventoryItem(slot)
    local id = cur and cur:getId() or 0
    local prev = lastSeen[slot]
    lastSeen[slot] = id
    if prev == nil or prev == id or id == 0 then return end
    if now - (ownMove[slot] or -1000000) < TRACK_OWN_MS then return end
    -- Cambio que NO hizo el script = lo hiciste tu (hotkey / arrastrar)
    if (holdSec or 0) > 0 then
      manualUntil[slot] = now + holdSec * 1000
    end
    return id   -- devuelve el ID que pusiste a mano
  end

  function EquipCore.isManual(slot)
    return now < (manualUntil[slot] or 0)
  end

  -- Motivo / estado de cada slot (para mostrarlo en pantalla)
  EquipCore.reason = {}
  local fails, warned, lastTarget = {}, {}, {}

  local function slotPos(slot) return {x = 65535, y = slot, z = 0} end

  local function cCount(c)
    return c.getItemsCount and c:getItemsCount() or #c:getItems()
  end
  local function hasRoom(c)
    local cap = c.getCapacity and c:getCapacity() or 0
    return cap > cCount(c) and c.getSlotPosition ~= nil
  end

  -- Busca una mochila abierta con espacio para dejar el item que estorba
  -- (primero la mochila preferida, si se indica)
  local function freeContainerPos(preferCid)
    if preferCid then
      local pc = g_game.getContainer(preferCid)
      if pc and hasRoom(pc) then return pc:getSlotPosition(cCount(pc)) end
    end
    for _, c in pairs(g_game.getContainers()) do
      if hasRoom(c) then return c:getSlotPosition(cCount(c)) end
    end
    return nil
  end

  -- -------------------------------------------------------------------
  -- DEVOLVER LA PIEZA QUITADA A LA MOCHILA DEL REEMPLAZO
  --  Al cambiar de set, la pieza que se quita la manda el servidor a
  --  cualquier mochila. Aqui se recuerda de que mochila salio la pieza
  --  nueva y la vieja se mueve a esa misma mochila.
  --  Una sola opcion para todos (storage.equipKeepBag).
  -- -------------------------------------------------------------------
  local giveBack, keepBoxes = {}, {}
  -- GB_IDLE: la devolucion espera a que TERMINE el cambio de set, para
  -- no meter movimientos extra en medio (eso hacia el cambio lento).
  local GB_WAIT, GB_STEP, GB_LOOK, GB_MOVES, GB_IDLE = 10000, 300, 8, 2, 1200

  function EquipCore.keepBag() return storage.equipKeepBag ~= false end

  -- Une un CheckBox de cualquier ventana con la opcion (se sincronizan)
  function EquipCore.bindKeepBag(box)
    if not box then return end
    table.insert(keepBoxes, box)
    box:setChecked(EquipCore.keepBag())
    box.onCheckChange = function(w, c)
      storage.equipKeepBag = c and true or false
      for _, b in ipairs(keepBoxes) do
        if b ~= w and b:isChecked() ~= c then b:setChecked(c) end
      end
    end
  end

  -- ID del contenedor donde esta un item (nil si no esta en mochila)
  local function containerOf(item)
    local ok, p = pcall(function() return item:getPosition() end)
    if ok and p and p.x == 65535 and p.y >= 64 then return p.y - 64 end
    return nil
  end

  -- IDs posibles de la pieza vieja (algunas cambian de ID al quitarlas)
  local function oldIds(oldId)
    local ids = {[oldId] = true}
    for k, v in pairs(alias) do
      if v == oldId then ids[k] = true end
    end
    return ids
  end

  local function processGiveBack(slot)
    local g = giveBack[slot]
    if not g then return end
    if not EquipCore.keepBag() or now - g.t > GB_WAIT
       or g.moves >= GB_MOVES or g.looks >= GB_LOOK then
      giveBack[slot] = nil
      return
    end
    if now < g.nextAt then return end
    if now - lastAction < GB_IDLE then return end   -- set aun cambiando
    g.nextAt = now + GB_STEP

    local src = g_game.getContainer(g.cid)
    if not src then giveBack[slot] = nil; return end
    local ids = oldIds(g.oldId)

    -- Ya esta en la mochila correcta
    for _, it in ipairs(src:getItems()) do
      if ids[it:getId()] then giveBack[slot] = nil; return end
    end

    -- Buscarla en las otras mochilas abiertas
    local found
    for cid, c in pairs(g_game.getContainers()) do
      if cid ~= g.cid then
        for _, it in ipairs(c:getItems()) do
          if ids[it:getId()] then found = it; break end
        end
      end
      if found then break end
    end
    if not found then g.looks = g.looks + 1; return end   -- aun no llega
    if not hasRoom(src) then giveBack[slot] = nil; return end

    g_game.move(found, src:getSlotPosition(cCount(src)), 1)
    g.moves = g.moves + 1
    EquipCore.reason[slot] = "devolviendo " .. g.oldId .. " a su mochila"
  end

  local function moveCount(item)
    if item.isStackable and item:isStackable() then return item:getCount() end
    return 1
  end

  -- Devuelve true si el item no aparece y hay que abrir mochilas
  function EquipCore.equip(slot, id)
    if not id or id <= 0 then
      EquipCore.reason[slot] = "casilla vacia"
      return false
    end
    local cur = getInventoryItem(slot)

    if lastTarget[slot] ~= id then
      lastTarget[slot], fails[slot], warned[slot] = id, 0, false
    end

    -- Aprender items que cambian de ID al ponerlos (solo cambios propios)
    local p = pending[slot]
    if p then
      if now - p.t >= OWN_MS then
        pending[slot] = nil
      elseif cur and cur:getId() ~= p.prevId and cur:getId() ~= 0 then
        if cur:getId() ~= p.id then alias[p.id] = cur:getId() end
        pending[slot] = nil
      end
    end

    if isEquipped(cur, id) then
      inflight[slot] = nil
      nextTry[slot], hotkeyTries[id], fails[slot] = nil, nil, 0
      warned[slot] = false
      EquipCore.reason[slot] = "OK"
      processGiveBack(slot)
      return false
    end
    if nextTry[slot] and now < nextTry[slot] then return false end
    local prevId = cur and cur:getId() or 0

    -- 1) Item en mochila abierta: un solo movimiento directo
    local item = findItem(id)
    if item then
      inflightCount()   -- limpia los ya confirmados
      if inflight[slot] then return false end   -- esta pieza ya va en camino
      local busy = potBusy()
      if busy then waitingAt = now end
      -- Con exhaust de pocion el servidor solo guarda 1 en espera
      if inflightCount() >= (busy and 1 or MAX_INFLIGHT) then
        EquipCore.reason[slot] = "en cola"
        waitingAt = now   -- los healers aguantan la pocion hasta que entre
        return false
      end
      local wait = INFLIGHT_MS
      if busy then
        wait = math.max(wait, (Shared.lastSelfPotion + POT_EXHAUST) - now + 300)
      end
      inflight[slot] = {prevId = prevId, expire = now + wait}
      nextTry[slot] = nil
      fails[slot] = (fails[slot] or 0) + 1
      pending[slot] = {id = id, t = now, prevId = prevId}
      ownMove[slot] = now
      lastAction = now

      local srcCid = containerOf(item)
      if EquipCore.keepBag() and srcCid and cur and prevId > 0
         and not (cur.isStackable and cur:isStackable()) then
        giveBack[slot] = {cid = srcCid, oldId = prevId, t = now,
                          nextAt = now + GB_STEP, looks = 0, moves = 0}
      end

      -- Cambio directo: se arrastra la pieza nueva encima de la vieja
      -- y el servidor las intercambia de una vez (sin desequipar antes).
      g_game.move(item, slotPos(slot), moveCount(item))
      EquipCore.reason[slot] = "moviendo " .. id
      return false
    end

    -- 2) Hotkey del servidor (mochilas cerradas)
    --    Nunca justo despues de mover: el hotkey desequipa si el item
    --    ya esta puesto y el servidor aun no lo confirmo.
    if now - (ownMove[slot] or -1000000) < OWN_MS then return false end
    if potBusy() then waitingAt = now; return false end
    local ht = hotkeyTries[id]
    if ht and now - ht.t > HOTKEY_RESET then ht = nil; hotkeyTries[id] = nil end
    if g_game.equipItemId and (not ht or ht.n < HOTKEY_MAX) then
      local ok = pcall(function() g_game.equipItemId(id, 0) end)
      if ok then
        hotkeyTries[id] = {n = (ht and ht.n or 0) + 1, t = now}
        lastAction = now
        pending[slot] = {id = id, t = now, prevId = prevId}
        ownMove[slot] = now
        nextTry[slot] = now + HOTKEY_RETRY
        EquipCore.reason[slot] = "buscando " .. id .. " (hotkey)"
        return false
      end
    end

    -- 3) Hay que abrir mochilas
    EquipCore.reason[slot] = "no esta en mochilas: " .. id
    return true
  end

  -- Si el servidor rechaza un movimiento, reintentar YA (no esperar
  -- RETRY_MS). Solo afecta a slots con un cambio en curso.
  pcall(function()
    onTextMessage(function(mode, text)
      local t = (text or ""):lower()
      -- Pociones usadas por cualquier lado (hotkey, otro script)
      if t:find("^using one of") or t:find("^using the last")
         or t:find("^usando uno de") or t:find("^usando el ultimo") then
        if now - (Shared.lastSelfPotion or -1000000) > 300 then
          Shared.lastSelfPotion = now - 150   -- el mensaje llega con lag
        end
        return
      end
      if not (t:find("exhaust") or t:find("not possible")
              or t:find("no es posible") or t:find("agotad")) then return end
      if now - lastAction > 1500 then return end
      for slot, p in pairs(pending) do
        if p and now - p.t < OWN_MS then
          nextTry[slot] = now + REJECT_RETRY
          inflight[slot] = nil
          pending[slot] = nil
        end
      end
    end)
  end)

  -- Cuando el servidor confirma una pieza, mandar la siguiente YA
  -- (sin esperar al siguiente ciclo del macro).
  pcall(function()
    onInventoryChange(function(player, slot, item, oldItem)
      if not inflight[slot] then return end
      inflight[slot] = nil
      for _, fn in ipairs(kicks) do pcall(fn) end
    end)
  end)

  -- Abrir mochilas cerradas (solo cuando falta un item)
  function EquipCore.openNextBag()
    if now - opener.last < OPEN_DELAY then return end
    local containers = g_game.getContainers()
    local count, openIds = 0, {}
    for _, c in pairs(containers) do
      count = count + 1
      local ci = c.getContainerItem and c:getContainerItem()
      if ci then openIds[ci:getId()] = true end
    end
    if count == 0 then
      opener.tried = {}
      local bp = getInventoryItem(SlotBack)
      if bp then g_game.open(bp, nil); opener.last = now end
      return
    end
    if count >= MAX_OPEN then return end
    for cid, c in pairs(containers) do
      for idx, item in ipairs(c:getItems()) do
        if item.isContainer and item:isContainer() then
          local key = tostring(cid) .. ":" .. idx .. ":" .. item:getId()
          if not opener.tried[key] and not openIds[item:getId()] then
            opener.tried[key] = true
            g_game.open(item, nil)
            opener.last = now
            return
          end
        end
      end
    end
  end
end

-- #####################################################################
-- 0. MAIN - Profesion (perfil para todas las vocaciones)
--  - Detecta la profesion del personaje (o la eliges a mano).
--  - "Aplicar perfil" pone en cada script los hechizos y opciones
--    de esa profesion. Pide un segundo clic para confirmar.
-- #####################################################################
__sec = startSection("Main")
do
setDefaultTab("Main")
UIx.header("PROFESION")

local PK = "vocProfileV1"
if type(storage[PK]) ~= "table" then storage[PK] = {mode = "auto"} end
local pc = storage[PK]
pc.mode = pc.mode or "auto"

-- IDs de vocacion del servidor (con y sin promocion)
local VOC_BY_ID = {
  [1] = "sorcerer", [5] = "sorcerer", [2] = "druid",  [6] = "druid",
  [3] = "paladin",  [7] = "paladin",  [4] = "knight", [8] = "knight",
  [9] = "monk",     [10] = "monk",
}
local VOC_NAME = {knight = "Knight", paladin = "Paladin", sorcerer = "Sorcerer",
                  druid = "Druid", monk = "Monk"}
local MODES = {"auto", "knight", "paladin", "sorcerer", "druid", "monk"}

function Prof.detect()
  local ok, v = pcall(function() return player:getVocation() end)
  if ok and type(v) == "number" then return VOC_BY_ID[v] end
  return nil
end

-- Profesion en uso (si no se puede detectar se asume Knight)
function Prof.get()
  if pc.mode ~= "auto" and VOC_NAME[pc.mode] then return pc.mode end
  return Prof.detect() or "knight"
end

-- Knight y Monk pelean pegados; Paladin y magos a distancia
function Prof.isMelee()
  local v = Prof.get()
  return v == "knight" or v == "monk"
end

function Prof.name(v) return VOC_NAME[v or Prof.get()] or "?" end

function Prof.apply()
  local v, notes = Prof.get(), {}
  for _, fn in ipairs(Prof.appliers) do
    local ok, msg = pcall(fn, v)
    if not ok then
      table.insert(notes, "error: " .. tostring(msg))
    elseif msg then
      table.insert(notes, msg)
    end
  end
  return notes
end

g_ui.loadUIFromString([[
VbProfilePanel < Panel
  height: 44

  Label
    id: info
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text-align: center
    color: #66ff66
    text: Profesion: ?

  Button
    id: modeBtn
    anchors.top: info.bottom
    anchors.left: parent.left
    anchors.right: parent.horizontalCenter
    margin-top: 4
    margin-right: 2
    height: 20
    text: Cambiar
    !tooltip: tr('Auto = detectar la profesion. Clic para elegirla a mano.')

  Button
    id: applyBtn
    anchors.top: info.bottom
    anchors.left: parent.horizontalCenter
    anchors.right: parent.right
    margin-top: 4
    margin-left: 2
    height: 20
    text: Aplicar perfil
    !tooltip: tr('Pone los hechizos y opciones de esta profesion en los scripts')
]])

local pUI = setupUI("VbProfilePanel\n  height: 44")
local lastInfo, confirmUntil = "", 0

local function refresh()
  local v = Prof.get()
  local txt
  if pc.mode == "auto" then
    txt = "Profesion: " .. Prof.name(v) .. (Prof.detect() and " (auto)" or " (no detectada)")
  else
    txt = "Profesion: " .. Prof.name(v) .. " (manual)"
  end
  if txt ~= lastInfo then
    lastInfo = txt
    pUI.info:setText(txt)
    pUI.info:setColor((pc.mode == "auto" and not Prof.detect()) and "#ffaa44" or "#66ff66")
  end
end

pUI.modeBtn.onClick = function()
  local idx = 1
  for i, m in ipairs(MODES) do if m == pc.mode then idx = i end end
  pc.mode = MODES[idx % #MODES + 1]
  refresh()
end

pUI.applyBtn.onClick = function()
  if now > confirmUntil then
    confirmUntil = now + 4000
    pUI.applyBtn:setText("Seguro? clic otra vez")
    return
  end
  confirmUntil = 0
  pUI.applyBtn:setText("Aplicar perfil")
  local notes = Prof.apply()
  warn("[Perfil " .. Prof.name() .. "] " ..
       (#notes > 0 and table.concat(notes, " | ") or "aplicado"))
end

macro(1000, function()
  refresh()
  if confirmUntil > 0 and now > confirmUntil then
    confirmUntil = 0
    pUI.applyBtn:setText("Aplicar perfil")
  end
end)
refresh()

end -- fin: 0. MAIN - Profesion
endSection(__sec)

-- #####################################################################
-- 1. MAIN - Exercise Trainer
-- #####################################################################
__sec = startSection("Main")
do
setDefaultTab("Main")
UIx.header("ENTRENAMIENTO E IMBUEMENTS")

local ET_KEY = "exerciseTrainerV5"

local STALL_MS           = 8000
local RETRY_MS           = 3000
local FALLBACK_MS        = 15 * 60 * 1000
local MAX_FAILS          = 5
local PAUSE_MS           = 2 * 60 * 1000
local SECONDS_PER_CHARGE = 2
local SCAN_MS            = 5000

local KNOWN_WEAPONS, DEFAULT_DUMMIES = {}, {}
for id = 28552, 28557 do KNOWN_WEAPONS[id] = true end
for id = 35279, 35290 do KNOWN_WEAPONS[id] = true end
for id = 28558, 28565 do DEFAULT_DUMMIES[id] = true end

if type(storage[ET_KEY]) ~= "table" then storage[ET_KEY] = {} end
local et = storage[ET_KEY]
et.weapons  = et.weapons  or {0, 0, 0}
et.dummyIds = et.dummyIds or {0, 0, 0, 0}
et.learned  = et.learned  or {}
for i = 1, 3 do et.weapons[i]  = et.weapons[i]  or 0 end
for i = 1, 4 do et.dummyIds[i] = et.dummyIds[i] or 0 end
if et.enabled == nil then et.enabled = false end
if et.autoDummy == nil then et.autoDummy = true end
if et.pauseOnPlayer == nil then et.pauseOnPlayer = false end
et.maxDist = et.maxDist or 7

local prev = storage.exerciseTrainerV4 or storage.exerciseTrainer
if type(prev) == "table" and not et.migrated then
  if type(prev.weapons) == "table" then
    for i = 1, 3 do
      if (prev.weapons[i] or 0) > 0 then et.weapons[i] = prev.weapons[i] end
    end
  elseif (prev.weaponId or 0) > 0 then
    et.weapons[1] = prev.weaponId
  end
  if prev.dummyPos and not et.dummyPos then et.dummyPos = prev.dummyPos end
  et.migrated = true
end

local st = {
  training = false, observing = false, confirmed = false,
  activeId = 0, lastTotal = 0, lastChange = 0, chargesMode = false,
  chargesWork = false, chargesUnreadable = false, noChange = 0,
  fallbackUntil = 0, nextAttempt = 0, fails = 0, pausedUntil = 0, ourUse = 0,
  found = {}, autoPick = nil, lastScan = 0, lastListRefresh = 0,
}

g_ui.loadUIFromString([[
ExerciseDummyRow < Label
  height: 18
  text-offset: 4 2
  focusable: true
  phantom: false
  background-color: alpha
  $hover:
    background-color: #ffffff18
  $focus:
    background-color: #ffffff28

ExerciseTrainerWindow < MainWindow
  !text: tr('Exercise Trainer')
  size: 420 540
  @onEscape: self:hide()

  VbTitle
    id: tWeapons
    anchors.top: parent.top
    anchors.left: parent.left
    text: Armas de entrenamiento

  VbHint
    id: hWeapons
    anchors.top: tWeapons.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 2
    text: Arrastra tus exercise weapons. Se usan en orden 1, 2 y 3.

  BotItem
    id: w1
    anchors.top: hWeapons.bottom
    anchors.left: parent.left
    margin-top: 4
    !tooltip: tr('Arma 1 (primera opcion)')

  BotItem
    id: w2
    anchors.top: w1.top
    anchors.left: w1.right
    margin-left: 6
    !tooltip: tr('Arma 2')

  BotItem
    id: w3
    anchors.top: w1.top
    anchors.left: w2.right
    margin-left: 6
    !tooltip: tr('Arma 3')

  HorizontalSeparator
    id: sep1
    anchors.top: w1.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tDummy
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Dummy

  CheckBox
    id: autoDummy
    anchors.top: tDummy.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Elegir automaticamente el mas cercano

  VerticalScrollBar
    id: dummyScroll
    anchors.top: autoDummy.bottom
    anchors.right: parent.right
    margin-top: 4
    height: 92
    step: 18
    pixels-scroll: true

  TextList
    id: dummyList
    anchors.top: dummyScroll.top
    anchors.left: parent.left
    anchors.right: dummyScroll.left
    height: 92
    vertical-scrollbar: dummyScroll

  Button
    id: scanBtn
    anchors.top: dummyList.bottom
    anchors.left: parent.left
    margin-top: 4
    width: 80
    text: Buscar
    !tooltip: tr('Buscar dummies alrededor')

  Label
    id: currentDummy
    anchors.verticalCenter: scanBtn.verticalCenter
    anchors.left: scanBtn.right
    anchors.right: parent.right
    margin-left: 8
    text: Dummy: ninguno

  Label
    id: lblIds
    anchors.top: scanBtn.bottom
    anchors.left: parent.left
    margin-top: 10
    text-auto-resize: true
    text: IDs de dummy extra (opcional, si tu servidor usa otros):

  BotItem
    id: d1
    anchors.top: lblIds.bottom
    anchors.left: parent.left
    margin-top: 4

  BotItem
    id: d2
    anchors.top: d1.top
    anchors.left: d1.right
    margin-left: 6

  BotItem
    id: d3
    anchors.top: d1.top
    anchors.left: d2.right
    margin-left: 6

  BotItem
    id: d4
    anchors.top: d1.top
    anchors.left: d3.right
    margin-left: 6

  HorizontalSeparator
    id: sep2
    anchors.top: d1.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tOpts
    anchors.top: sep2.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Opciones

  CheckBox
    id: pauseOnPlayer
    anchors.top: tOpts.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Pausar si hay otros jugadores en pantalla

  Label
    id: lblDist
    anchors.top: pauseOnPlayer.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 190
    text: Distancia de busqueda (sqm):

  SpinBox
    id: maxDist
    anchors.verticalCenter: lblDist.verticalCenter
    anchors.left: lblDist.right
    width: 45
    minimum: 1
    maximum: 8

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: startBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: startBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 100
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

local etUI = UIx.scriptPanel("Exercise Trainer")

local win = UI.createWindow('ExerciseTrainerWindow', rootWidget)
win:hide()

local function setEtStatus(text, color)
  UIx.setLabel(etUI.status, text, color)
  UIx.setLabel(win.status, text, color)
end

local lastWarnMsg, lastWarnAt = "", 0
local function notify(msg)
  if msg ~= lastWarnMsg or now - lastWarnAt > 60000 then
    warn("[Trainer] " .. msg)
    lastWarnMsg, lastWarnAt = msg, now
  end
end

local function samePos(a, b)
  return a and b and a.x == b.x and a.y == b.y and a.z == b.z
end

local function posText(p)
  return "[" .. p.x .. "," .. p.y .. "," .. p.z .. "]"
end

local function isConfiguredWeapon(id)
  for i = 1, 3 do
    if et.weapons[i] == id then return true end
  end
  return false
end

local function isDummyId(id)
  if not id or id <= 0 then return false end
  if DEFAULT_DUMMIES[id] then return true end
  for i = 1, 4 do
    if et.dummyIds[i] == id then return true end
  end
  for _, l in ipairs(et.learned) do
    if l == id then return true end
  end
  return false
end

local function learnDummy(id)
  if id and id > 0 and not isDummyId(id) then
    table.insert(et.learned, id)
    notify("Nuevo dummy aprendido: ID " .. id)
  end
end

local function weaponCharges(id)
  local total, maxc = 0, 0
  for _, container in pairs(g_game.getContainers()) do
    for _, item in ipairs(container:getItems()) do
      if item:getId() == id then
        local c = item:getCount() or 1
        total = total + c
        if c > maxc then maxc = c end
      end
    end
  end
  return total, maxc
end

local function findWeapon()
  for i = 1, 3 do
    local id = et.weapons[i]
    if id and id > 0 then
      local item = findItem(id)
      if item then return item, id end
    end
  end
  return nil, 0
end

local function playersOnScreen()
  for _, spec in ipairs(getSpectators()) do
    if spec:isPlayer() and not spec:isLocalPlayer() then return true end
  end
  return false
end

local function scanDummies()
  local res, me = {}, pos()
  if not me then return res end
  local r = et.maxDist
  for dx = -r, r do
    for dy = -r, r do
      local tp = {x = me.x + dx, y = me.y + dy, z = me.z}
      local tile = g_map.getTile(tp)
      if tile then
        for _, item in ipairs(tile:getItems() or {}) do
          local id = item:getId()
          if isDummyId(id) then
            table.insert(res, {pos = tp, id = id,
              dist = math.max(math.abs(dx), math.abs(dy))})
            break
          end
        end
      end
    end
  end
  table.sort(res, function(a, b) return a.dist < b.dist end)
  return res
end

local function rescan()
  st.found = scanDummies()
  st.lastScan = now
  if et.autoDummy then
    st.autoPick = st.found[1] and st.found[1].pos or nil
  end
end

local function selectedDummyPos()
  if et.autoDummy then
    if not st.autoPick or now - st.lastScan >= SCAN_MS then rescan() end
    return st.autoPick
  end
  return et.dummyPos
end

local function getDummyThing(p)
  if not p then
    return nil, et.autoDummy and "No hay dummies cerca" or "Elige un dummy en Config"
  end
  local me = pos()
  if not me or me.z ~= p.z then return nil, "Dummy en otro piso" end
  local tile = g_map.getTile(p)
  if not tile then return nil, "Dummy fuera de vista" end
  local thing = tile:getTopUseThing()
  if not thing then return nil, "Dummy no encontrado" end
  return thing
end

local function updateCurrentLabel()
  local p = et.autoDummy and st.autoPick or et.dummyPos
  local prefix = et.autoDummy and "Auto: " or "Elegido: "
  win.currentDummy:setText(p and (prefix .. posText(p)) or "Dummy: ninguno")
  win.currentDummy:setColor(p and "#66ff66" or "#aaaaaa")
end

local function refreshDummyList()
  local list = win.dummyList
  list:destroyChildren()
  local cur = et.autoDummy and st.autoPick or et.dummyPos

  if #st.found == 0 then
    local row = UI.createWidget('ExerciseDummyRow', list)
    row:setText("(no hay dummies a la vista - pulsa Buscar)")
    row:setColor("#888888")
  end

  for _, d in ipairs(st.found) do
    local row = UI.createWidget('ExerciseDummyRow', list)
    local selected = samePos(cur, d.pos)
    row:setText((selected and "> " or "   ") .. "ID " .. d.id ..
      "   a " .. d.dist .. " sqm   " .. posText(d.pos))
    row:setColor(selected and "#66ff66" or "#cccccc")
    row.onClick = function()
      et.autoDummy = false
      win.autoDummy:setChecked(false)
      et.dummyPos = {x = d.pos.x, y = d.pos.y, z = d.pos.z}
      refreshDummyList()
    end
  end
  updateCurrentLabel()
end

local function markTraining(id)
  local total, maxc = weaponCharges(id)
  st.training      = true
  st.observing     = false
  st.confirmed     = false
  st.activeId      = id
  st.lastTotal     = total
  st.lastChange    = now
  st.chargesMode   = maxc > 1 and not st.chargesUnreadable
  st.fallbackUntil = now + FALLBACK_MS
end

local function resetRun()
  st.training, st.observing = false, false
  st.fails, st.pausedUntil, st.nextAttempt = 0, 0, 0
end

for i = 1, 3 do
  local w = win["w" .. i]
  w:setItemId(et.weapons[i] or 0)
  w.onItemChange = function(widget) et.weapons[i] = widget:getItemId() end
end

for i = 1, 4 do
  local w = win["d" .. i]
  w:setItemId(et.dummyIds[i] or 0)
  w.onItemChange = function(widget)
    et.dummyIds[i] = widget:getItemId()
    rescan()
    refreshDummyList()
  end
end

win.autoDummy:setChecked(et.autoDummy)
win.autoDummy.onCheckChange = function(widget, checked)
  et.autoDummy = checked
  rescan()
  refreshDummyList()
end

win.pauseOnPlayer:setChecked(et.pauseOnPlayer)
win.pauseOnPlayer.onCheckChange = function(widget, checked)
  et.pauseOnPlayer = checked
end

win.maxDist:setValue(et.maxDist)
win.maxDist.onValueChange = function(widget, value)
  et.maxDist = value
end

win.scanBtn.onClick = function()
  rescan()
  refreshDummyList()
end
win.closeBtn.onClick = function() win:hide() end

etUI.setupBtn.onClick = function()
  UIx.toggleWindow(win, function()
    rescan()
    refreshDummyList()
  end)
end

UIx.bindSwitch(et, etUI.switch, win.startBtn, function(value)
  resetRun()
  if value then
    local item, wid = findWeapon()
    if item then
      local _, maxc = weaponCharges(wid)
      if maxc > 1 then
        markTraining(wid)
        st.observing = true
      end
    end
    rescan()
    setEtStatus("Activo", "#66ff66")
  else
    setEtStatus("Inactivo")
  end
end)

onUseWith(function(p, itemId, target, subType)
  if not (isConfiguredWeapon(itemId) or KNOWN_WEAPONS[itemId]) then return end
  if not target or not target.getPosition then return end
  local tp = target:getPosition()
  if not tp then return end

  if target.isItem and target:isItem() then
    learnDummy(target:getId())
  end

  if (et.weapons[1] or 0) == 0 then
    et.weapons[1] = itemId
    win.w1:setItemId(itemId)
  end

  if now <= st.ourUse then return end

  if et.autoDummy then
    st.autoPick = {x = tp.x, y = tp.y, z = tp.z}
  else
    et.dummyPos = {x = tp.x, y = tp.y, z = tp.z}
  end
  if et.enabled then markTraining(itemId) end
  if win:isVisible() then refreshDummyList() end
end)

onTextMessage(function(mode, text)
  if not et.enabled or not st.training or not text then return end
  local t = text:lower()
  if (t:find("training") or t:find("entrena")) and
     (t:find("stop") or t:find("ended") or t:find("interrupt") or t:find("finish")
      or t:find("cancel") or t:find("deten") or t:find("termin")) then
    st.training = false
    st.nextAttempt = now + 2000
  end
end)

macro(1000, function()
  if win:isVisible() and now - st.lastListRefresh >= 3000 then
    st.lastListRefresh = now
    if not st.training then rescan() end
    refreshDummyList()
  end

  if not et.enabled then return end
  if not g_game.isOnline() then st.training = false return end

  if st.training then
    if st.chargesMode then
      local total = weaponCharges(st.activeId)
      if total ~= st.lastTotal then
        if total < st.lastTotal then
          st.confirmed, st.chargesWork = true, true
          st.fails, st.noChange = 0, 0
        end
        st.lastTotal, st.lastChange = total, now
      end

      if total == 0 or now - st.lastChange >= STALL_MS then
        st.training = false
        if not st.confirmed and not st.observing then
          st.fails = st.fails + 1
          if not st.chargesWork then
            st.noChange = st.noChange + 1
            if st.noChange >= 2 then st.chargesUnreadable = true end
          end
        end
        st.observing = false
        st.nextAttempt = now + 1000
      else
        local mins = math.floor(total * SECONDS_PER_CHARGE / 60)
        setEtStatus("Entrenando: " .. total .. " cargas (~" .. mins .. " min)", "#66ff66")
        return
      end
    else
      if now < st.fallbackUntil then
        local mins = math.ceil((st.fallbackUntil - now) / 60000)
        setEtStatus("Entrenando (reuso en ~" .. mins .. " min)", "#66ff66")
        return
      end
      st.training = false
    end
  end

  if now < st.pausedUntil then
    setEtStatus("Pausa por fallos (" .. math.ceil((st.pausedUntil - now) / 1000) .. "s)", "#ffaa44")
    return
  end
  if st.fails >= MAX_FAILS then
    st.fails = 0
    st.pausedUntil = now + PAUSE_MS
    notify("Varios intentos sin entrenar. Pausa de 2 min; revisa dummy y armas.")
    return
  end
  if et.pauseOnPlayer and playersOnScreen() then
    setEtStatus("En pausa: jugador en pantalla", "#ffcc66")
    return
  end

  if now < st.nextAttempt then return end
  st.nextAttempt = now + RETRY_MS

  local dummyPos = selectedDummyPos()
  local dummy, why = getDummyThing(dummyPos)
  if not dummy then
    if et.autoDummy then st.autoPick = nil end
    setEtStatus(why, "#ffaa44")
    return
  end

  local weapon, wid = findWeapon()
  if not weapon then
    setEtStatus("Sin exercise weapons", "#ff6666")
    notify("No quedan exercise weapons en las mochilas abiertas.")
    return
  end

  st.ourUse = now + 500
  g_game.useWith(weapon, dummy)
  markTraining(wid)
  setEtStatus("Iniciando en " .. posText(dummyPos), "#88ff88")
end)

end -- fin: 1. MAIN - Exercise Trainer
endSection(__sec)

-- #####################################################################
-- 2. MAIN - Smart Imbue
-- #####################################################################
__sec = startSection("Main")
do
setDefaultTab("Main")

local CFG_KEY   = "smartImbueV2"
local MAX_SLOTS = 3

local ITEMS = {
  {key = "helmet",   label = "Casco",    slot = SlotHead},
  {key = "armor",    label = "Armadura", slot = SlotBody},
  {key = "weapon",   label = "Arma",     slot = SlotRight},
  {key = "boots",    label = "Botas",    slot = SlotFeet},
  {key = "shield",   label = "Escudo",   slot = SlotLeft},
  {key = "backpack", label = "Mochila",  slot = SlotBack},
}
local ITEM_BY_KEY = {}
for _, it in ipairs(ITEMS) do ITEM_BY_KEY[it.key] = it end

local function defaultConfig()
  local c = {
    enabled = false,
    items = {},
    opts = {noCombat = true, minHp = 60, minMp = 30, monsterRange = 7,
            scanSec = 30, delayMs = 1500}
  }
  for _, it in ipairs(ITEMS) do
    c.items[it.key] = {target = 0, slots = {}}
    for i = 1, MAX_SLOTS do c.items[it.key].slots[i] = {id = 0, name = ""} end
  end
  return c
end

storage[CFG_KEY] = storage[CFG_KEY] or defaultConfig()
local cfg = storage[CFG_KEY]
local def = defaultConfig()
cfg.opts  = cfg.opts or def.opts
for k, v in pairs(def.opts) do if cfg.opts[k] == nil then cfg.opts[k] = v end end
cfg.items = cfg.items or def.items
for _, it in ipairs(ITEMS) do
  cfg.items[it.key] = cfg.items[it.key] or def.items[it.key]
  cfg.items[it.key].slots = cfg.items[it.key].slots or {}
  for i = 1, MAX_SLOTS do
    cfg.items[it.key].slots[i] = cfg.items[it.key].slots[i] or {id = 0, name = ""}
  end
end

local old = storage.smartImbue
if old and not cfg.migrated then
  local map = {
    helmet = {old.targetHelmet, {old.h1, old.h2}},
    armor  = {old.targetArmor,  {old.a1, old.a2}},
    weapon = {old.targetWeapon, {old.w1, old.w2, old.w3}},
    boots  = {old.targetBoots,  {old.bt1}},
  }
  for key, v in pairs(map) do
    if (v[1] or 0) > 0 then cfg.items[key].target = v[1] end
    for i = 1, MAX_SLOTS do
      local id = v[2][i]
      if id and id > 0 then cfg.items[key].slots[i].id = id end
    end
  end
  cfg.migrated = true
end

g_ui.loadUIFromString([[
SmartImbueRow < Panel
  height: 56

  Label
    id: title
    anchors.top: parent.top
    anchors.left: parent.left
    width: 110
    color: #ffaa00

  Label
    id: status
    anchors.top: parent.top
    anchors.left: title.right
    anchors.right: parent.right
    text-align: right
    color: #aaaaaa
    text: -

  BotItem
    id: target
    anchors.top: title.bottom
    anchors.left: parent.left
    margin-top: 3
    !tooltip: tr('Item a imbuir')

  Label
    id: arrow
    anchors.verticalCenter: target.verticalCenter
    anchors.left: target.right
    margin-left: 4
    width: 14
    text: >>

  BotItem
    id: s1
    anchors.top: target.top
    anchors.left: arrow.right
    margin-left: 4
    !tooltip: tr('Scroll 1')

  TextEdit
    id: n1
    anchors.verticalCenter: s1.verticalCenter
    anchors.left: s1.right
    margin-left: 3
    width: 72
    height: 20
    !tooltip: tr('Nombre del imbuement (ej: Vampirism)')

  BotItem
    id: s2
    anchors.top: target.top
    anchors.left: n1.right
    margin-left: 8
    !tooltip: tr('Scroll 2')

  TextEdit
    id: n2
    anchors.verticalCenter: s2.verticalCenter
    anchors.left: s2.right
    margin-left: 3
    width: 72
    height: 20
    !tooltip: tr('Nombre del imbuement (ej: Void)')

  BotItem
    id: s3
    anchors.top: target.top
    anchors.left: n2.right
    margin-left: 8
    !tooltip: tr('Scroll 3')

  TextEdit
    id: n3
    anchors.verticalCenter: s3.verticalCenter
    anchors.left: s3.right
    margin-left: 3
    width: 72
    height: 20
    !tooltip: tr('Nombre del imbuement (ej: Strike)')

  HorizontalSeparator
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: parent.bottom

SmartImbueWindow < MainWindow
  !text: tr('Smart Imbue')
  size: 450 620
  @onEscape: self:hide()

  VbHint
    id: hint
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text: Arrastra el item y sus scrolls. Escribe el nombre del imbuement tal como sale al mirar (Look) el item, por ejemplo: Vampirism.

  Panel
    id: rows
    anchors.top: hint.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    height: 346
    layout:
      type: verticalBox
      spacing: 2

  VbTitle
    id: tOpts
    anchors.top: rows.bottom
    anchors.left: parent.left
    margin-top: 8
    text: Condiciones para aplicar

  CheckBox
    id: noCombat
    anchors.top: tOpts.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Solo sin combate (sin target ni monstruos cerca)

  Label
    id: lblHp
    anchors.top: noCombat.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 60
    text: HP min %

  SpinBox
    id: minHp
    anchors.verticalCenter: lblHp.verticalCenter
    anchors.left: lblHp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lblMp
    anchors.verticalCenter: lblHp.verticalCenter
    anchors.left: minHp.right
    margin-left: 14
    width: 60
    text: MP min %

  SpinBox
    id: minMp
    anchors.verticalCenter: lblHp.verticalCenter
    anchors.left: lblMp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lblRange
    anchors.verticalCenter: lblHp.verticalCenter
    anchors.left: minMp.right
    margin-left: 14
    width: 70
    text: Rango mob

  SpinBox
    id: monsterRange
    anchors.verticalCenter: lblHp.verticalCenter
    anchors.left: lblRange.right
    width: 40
    minimum: 1
    maximum: 10

  Label
    id: lblScan
    anchors.top: lblHp.bottom
    anchors.left: parent.left
    margin-top: 16
    width: 105
    text: Revisar cada (s)

  SpinBox
    id: scanSec
    anchors.verticalCenter: lblScan.verticalCenter
    anchors.left: lblScan.right
    width: 50
    minimum: 5
    maximum: 600

  Label
    id: lblDelay
    anchors.verticalCenter: lblScan.verticalCenter
    anchors.left: scanSec.right
    margin-left: 14
    width: 135
    text: Pausa entre usos (ms)

  SpinBox
    id: delayMs
    anchors.verticalCenter: lblScan.verticalCenter
    anchors.left: lblDelay.right
    width: 55
    minimum: 300
    maximum: 5000
    step: 100

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: checkNow
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 100
    text: Revisar ahora

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

local mainUI = UIx.scriptPanel("Smart Imbue")

local win = UI.createWindow('SmartImbueWindow', rootWidget)
win:hide()

local function trim(s) return (s or ""):match("^%s*(.-)%s*$") end

local rows = {}

local function setStatus(text, color)
  UIx.setLabel(mainUI.status, text, color)
  UIx.setLabel(win.status, text, color)
end

local function setRowStatus(key, text, color)
  local r = rows[key]
  if not r then return end
  r.status:setText(text)
  r.status:setColor(color or "#aaaaaa")
end

local function slotLabel(key, i)
  local s = cfg.items[key].slots[i]
  local n = trim(s.name)
  return n ~= "" and n or ("scroll #" .. s.id)
end

local function hasConfig(key)
  local ic = cfg.items[key]
  if (ic.target or 0) <= 0 then return false end
  for i = 1, MAX_SLOTS do
    if (ic.slots[i].id or 0) > 0 then return true end
  end
  return false
end

local function findInContainers(id)
  for _, container in pairs(g_game.getContainers()) do
    for _, item in ipairs(container:getItems()) do
      if item:getId() == id then return item end
    end
  end
  return nil
end

local function findTarget(key)
  local id = cfg.items[key].target or 0
  if id <= 0 then return nil end
  local slot = ITEM_BY_KEY[key].slot
  local eq = getSlot(slot)
  if eq and eq:getId() == id then return eq end
  local alt = (slot == SlotRight and SlotLeft) or (slot == SlotLeft and SlotRight) or nil
  if alt then
    local a = getSlot(alt)
    if a and a:getId() == id then return a end
  end
  return findInContainers(id)
end

local function findScroll(id)
  if not id or id <= 0 then return nil end
  return findInContainers(id) or (findItem and findItem(id)) or nil
end

local lastAction      = 0
local lastExternalUse = 0
local ourUseUntil     = 0

local function recordExternalUse()
  if now > ourUseUntil then lastExternalUse = now end
end
if onUseWith then onUseWith(function() recordExternalUse() end) end
if onUse then onUse(function() recordExternalUse() end) end

local function groupCooldown(groupId)
  local ok, res = pcall(function()
    return modules.game_cooldown.isGroupCooldownIconActive(groupId)
  end)
  return ok and res == true
end

local function monstersNear(range)
  local p = pos()
  for _, spec in ipairs(getSpectators()) do
    if spec:isMonster() and getDistanceBetween(p, spec:getPosition()) <= range then
      return true
    end
  end
  return false
end

local function canUseScroll()
  local o = cfg.opts
  if hppercent() < o.minHp then return false, "HP bajo" end
  if manapercent() < o.minMp then return false, "MP bajo" end
  if o.noCombat then
    if g_game.isAttacking() then return false, "atacando" end
    if monstersNear(o.monsterRange) then return false, "monstruos cerca" end
  end
  if groupCooldown(2) then return false, "CD de curacion" end
  if now - lastExternalUse < o.delayMs then return false, "otra accion reciente" end
  if now - lastAction < o.delayMs then return false, nil end
  return true
end

local queue       = {}
local checkList   = {}
local pendingLook = nil
local lastLook    = 0
local lastScan    = 0
local attempts    = {}

local function addCheck(key)
  for _, k in ipairs(checkList) do if k == key then return end end
  table.insert(checkList, key)
end

local function isBlocked(key, i)
  local a = attempts[key .. ":" .. i]
  return a and a.blockedUntil and now < a.blockedUntil
end

local function registerAttempt(key, i)
  local id = key .. ":" .. i
  attempts[id] = attempts[id] or {n = 0}
  local a = attempts[id]
  a.n = a.n + 1
  if a.n >= 3 then
    a.n = 0
    a.blockedUntil = now + 5 * 60 * 1000
  end
end

local function enqueue(key, i)
  if isBlocked(key, i) then return false end
  for _, q in ipairs(queue) do
    if q.key == key and q.slot == i then return true end
  end
  table.insert(queue, {key = key, slot = i})
  return true
end

local function parseImbuements(text)
  local inside = text:match("[Ii]mbu%a*:%s*%((.-)%)")
  if not inside then return nil end
  local res = {active = {}, empty = 0}
  for entry in inside:gmatch("[^,]+") do
    local e = trim(entry):lower()
    if e:find("empty") or e:find("vac") then
      res.empty = res.empty + 1
    elseif e ~= "" then
      table.insert(res.active, e)
    end
  end
  return res
end

local function handleLook(key, text)
  local info = parseImbuements(text)
  if not info then
    setRowStatus(key, "Sin info de imbuements", "#ffaa44")
    return
  end

  local ic = cfg.items[key]
  local activeText = table.concat(info.active, " | ")
  local missing, unnamed = {}, {}

  for i = 1, MAX_SLOTS do
    local s = ic.slots[i]
    if (s.id or 0) > 0 then
      local name = trim(s.name):lower()
      if name == "" then
        table.insert(unnamed, i)
      elseif activeText:find(name, 1, true) then
        attempts[key .. ":" .. i] = nil
      else
        table.insert(missing, i)
      end
    end
  end

  local free = info.empty - #missing
  for _, i in ipairs(unnamed) do
    if free <= 0 then break end
    table.insert(missing, i)
    free = free - 1
  end

  if #missing == 0 then
    setRowStatus(key, "OK (" .. #info.active .. " activos)", "#66ff66")
    return
  end

  local names, queued, blocked = {}, 0, 0
  for idx, i in ipairs(missing) do
    table.insert(names, slotLabel(key, i))
    if idx <= info.empty then
      if enqueue(key, i) then queued = queued + 1 else blocked = blocked + 1 end
    end
  end

  local msg = "Falta: " .. table.concat(names, ", ")
  if info.empty == 0 then
    msg = msg .. " (sin slot libre)"
  elseif blocked > 0 then
    msg = msg .. " (bloqueado 5 min)"
  end
  setRowStatus(key, msg, "#ff6666")
end

for _, it in ipairs(ITEMS) do
  local key = it.key
  local ic  = cfg.items[key]
  local row = UI.createWidget('SmartImbueRow', win.rows)
  rows[key] = row
  row.title:setText(it.label)

  row.target:setItemId(ic.target or 0)
  row.target.onItemChange = function(w)
    ic.target = w:getItemId()
    addCheck(key)
  end

  for i = 1, MAX_SLOTS do
    local sw, nw = row["s" .. i], row["n" .. i]
    sw:setItemId(ic.slots[i].id or 0)
    sw.onItemChange = function(w)
      ic.slots[i].id = w:getItemId()
      attempts[key .. ":" .. i] = nil
    end
    nw:setText(ic.slots[i].name or "")
    nw.onTextChange = function(w, text)
      ic.slots[i].name = text
    end
  end
end

local o = cfg.opts
win.noCombat:setChecked(o.noCombat)
win.minHp:setValue(o.minHp)
win.minMp:setValue(o.minMp)
win.monsterRange:setValue(o.monsterRange)
win.scanSec:setValue(o.scanSec)
win.delayMs:setValue(o.delayMs)

win.noCombat.onCheckChange     = function(w, checked) o.noCombat = checked end
win.minHp.onValueChange        = function(w, v) o.minHp = v end
win.minMp.onValueChange        = function(w, v) o.minMp = v end
win.monsterRange.onValueChange = function(w, v) o.monsterRange = v end
win.scanSec.onValueChange      = function(w, v) o.scanSec = v end
win.delayMs.onValueChange      = function(w, v) o.delayMs = v end

win.checkNow.onClick = function()
  attempts = {}
  lastScan = 0
  setStatus("Revisando items...", "#88ccff")
end
win.closeBtn.onClick = function() win:hide() end
mainUI.setupBtn.onClick = function() UIx.toggleWindow(win) end

UIx.bindSwitch(cfg, mainUI.switch, win.enableBtn, function(value)
  queue, checkList, pendingLook = {}, {}, nil
  if value then
    lastScan = 0
    setStatus("Activo", "#66ff66")
  else
    setStatus("Inactivo")
  end
end)

macro(200, function()
  if not cfg.enabled then return end

  if pendingLook then
    if now - pendingLook.time > 2500 then
      setRowStatus(pendingLook.key, "Sin respuesta al Look", "#ffaa44")
      pendingLook = nil
    else
      return
    end
  end

  if #queue > 0 then
    local ok, reason = canUseScroll()
    if not ok then
      if reason then setStatus("En espera: " .. reason, "#ffcc66") end
      return
    end

    local job    = table.remove(queue, 1)
    local slotId = cfg.items[job.key].slots[job.slot].id
    local target = findTarget(job.key)
    local scroll = findScroll(slotId)
    local label  = slotLabel(job.key, job.slot)

    if not target then
      setRowStatus(job.key, "Item no encontrado", "#ffaa44")
      return
    end
    if not scroll then
      setRowStatus(job.key, "Sin scroll: " .. label, "#ff6666")
      return
    end

    registerAttempt(job.key, job.slot)
    ourUseUntil = now + 300
    useWith(scroll, target)
    lastAction = now
    setStatus("Aplicando " .. label .. " en " .. ITEM_BY_KEY[job.key].label, "#88ff88")
    schedule(1500, function() addCheck(job.key) end)
    return
  end

  if now - lastScan >= cfg.opts.scanSec * 1000 then
    lastScan = now
    for _, it in ipairs(ITEMS) do
      if hasConfig(it.key) then addCheck(it.key) end
    end
    setStatus("Activo", "#66ff66")
  end

  if #checkList > 0 and now - lastLook >= 800 then
    local key = table.remove(checkList, 1)
    if hasConfig(key) then
      local target = findTarget(key)
      if target then
        pendingLook = {key = key, time = now}
        lastLook = now
        g_game.look(target)
      else
        setRowStatus(key, "Item no encontrado", "#ffaa44")
      end
    end
  end
end)

onTextMessage(function(mode, text)
  if not cfg.enabled or not text then return end

  if pendingLook then
    local isLook = (MessageModes and MessageModes.Look and mode == MessageModes.Look)
      or text:find("^You see") or text:find("^Ves ")
      or text:find("[Ii]mbu%a*:%s*%(")
    if isLook then
      local key = pendingLook.key
      pendingLook = nil
      handleLook(key, text)
      return
    end
  end

  local t = text:lower()
  if t:find("imbu") and (t:find("expire") or t:find("ended") or t:find("ran out")
      or t:find("venci") or t:find("expir") or t:find("termin")) then
    lastScan = 0
  end
end)

end -- fin: 2. MAIN - Smart Imbue
endSection(__sec)

-- #####################################################################
-- 3. HP - War Healer + Anillo y Amuleto + Equipo Auto
-- #####################################################################
__sec = startSection("HP")
do
setDefaultTab("HP")
UIx.header("CURACION Y EQUIPO")

-- ============================================================
-- WAR HEALER
--  - 3 hechizos de curacion con HP, cooldown y mana minima.
--  - 2 pociones de vida revisadas en orden (ej: la de lvl 1000 en
--    la 1 y la normal en la 2). Si se acaba una, usa la otra.
--  - Pocion de mana y anti-paralyze opcional.
--  - "Aplicar perfil" (Main) pone los hechizos de tu profesion.
--  - Si un amigo esta mas bajo que tu y el Party Support lo va a
--    curar con hechizo, le deja el turno (tu pocion sigue igual).
-- ============================================================
do
  local HK           = "warHealerV9"
  local POTION_RETRY = 250
  local GROUP_MS     = 1000
  local PARA_RETRY   = 800

  if type(storage[HK]) ~= "table" then
    storage[HK] = {
      enabled = false,
      spells = {
        {words = "exura gran ico", hp = 19, cd = 120, mana = 0},
        {words = "exura med ico",  hp = 95, cd = 2,   mana = 0},
        {words = "",               hp = 0,  cd = 0,   mana = 0},
      },
      potions    = {{id = 23375, hp = 79}, {id = 0, hp = 0}},
      manaPotion = {id = 0, mp = 40},
    }
  end
  local hc = storage[HK]
  hc.spells = hc.spells or {}
  for i = 1, 3 do
    hc.spells[i] = hc.spells[i] or {words = "", hp = 0, cd = 0}
    hc.spells[i].mana = hc.spells[i].mana or 0
  end
  -- Antes habia una sola pocion de vida: pasa a ser la pocion 1
  if type(hc.potions) ~= "table" then
    local p = hc.potion or {}
    hc.potions = {{id = p.id or 0, hp = p.hp or 0}, {id = 0, hp = 0}}
  end
  for i = 1, 2 do hc.potions[i] = hc.potions[i] or {id = 0, hp = 0} end
  hc.manaPotion = hc.manaPotion or {id = 0, mp = 0}
  if hc.antiPara == nil then hc.antiPara = false end
  hc.paraWords = hc.paraWords or "utani hur"
  hc.paraMana  = hc.paraMana or 60

  g_ui.loadUIFromString([[
WarHealerSpellRow < Panel
  height: 26

  Label
    id: num
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 16

  TextEdit
    id: words
    anchors.left: num.right
    anchors.verticalCenter: parent.verticalCenter
    width: 120
    height: 22
    !tooltip: tr('Palabras del hechizo (vacio = apagado)')

  Label
    id: lblHp
    anchors.left: words.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 8
    width: 34
    text: HP<=

  SpinBox
    id: hp
    anchors.left: lblHp.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 2
    width: 56
    height: 22
    minimum: 0
    maximum: 100

  Label
    id: lblCd
    anchors.left: hp.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 8
    width: 22
    text: CD

  SpinBox
    id: cd
    anchors.left: lblCd.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 2
    width: 56
    height: 22
    minimum: 0
    maximum: 3600
    !tooltip: tr('Cooldown del hechizo en segundos')

  Label
    id: lblMp
    anchors.left: cd.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 8
    width: 32
    text: MP>=

  SpinBox
    id: mana
    anchors.left: lblMp.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 2
    width: 56
    height: 22
    minimum: 0
    maximum: 100

WarHealerPotionRow < Panel
  height: 36

  Label
    id: num
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 16

  BotItem
    id: item
    anchors.left: num.right
    anchors.verticalCenter: parent.verticalCenter

  Label
    id: lbl
    anchors.left: item.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 8
    width: 150
    text: Usar si HP % <=

  SpinBox
    id: hp
    anchors.left: lbl.right
    anchors.verticalCenter: parent.verticalCenter
    width: 45
    minimum: 0
    maximum: 100

WarHealerWindow < MainWindow
  !text: tr('War Healer')
  size: 430 600
  @onEscape: self:hide()

  VbTitle
    id: tSpells
    anchors.top: parent.top
    anchors.left: parent.left
    text: Hechizos de curacion

  VbHint
    id: hSpells
    anchors.top: tSpells.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 2
    text: Se revisan en orden 1, 2, 3. CD = cooldown en segundos. MP>= = mana minima para tirarlo (0 = no revisar). Palabras vacias = fila apagada.

  Panel
    id: spells
    anchors.top: hSpells.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 90
    layout:
      type: verticalBox
      spacing: 3

  HorizontalSeparator
    id: sep1
    anchors.top: spells.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6

  VbTitle
    id: tPots
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Pociones de vida

  VbHint
    id: hPots
    anchors.top: tPots.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 2
    text: Se revisan en orden. Pon la mas fuerte (ej: la de lvl 1000) en la 1 con el HP mas bajo, y la normal en la 2. Si se acaba una, usa la otra.

  Panel
    id: pots
    anchors.top: hPots.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 76
    layout:
      type: verticalBox
      spacing: 4

  HorizontalSeparator
    id: sep2
    anchors.top: pots.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6

  VbTitle
    id: tMana
    anchors.top: sep2.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Pocion de mana (casilla vacia = apagada)

  BotItem
    id: manaPotion
    anchors.top: tMana.bottom
    anchors.left: parent.left
    margin-top: 4
    margin-left: 16

  Label
    id: lblManaMp
    anchors.verticalCenter: manaPotion.verticalCenter
    anchors.left: manaPotion.right
    margin-left: 8
    width: 150
    text: Usar si MP % <=

  SpinBox
    id: manaMp
    anchors.verticalCenter: manaPotion.verticalCenter
    anchors.left: lblManaMp.right
    width: 45
    minimum: 0
    maximum: 100

  HorizontalSeparator
    id: sep3
    anchors.top: manaPotion.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tPara
    anchors.top: sep3.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Anti-paralyze

  CheckBox
    id: antiPara
    anchors.top: tPara.bottom
    anchors.left: parent.left
    margin-top: 6
    width: 150
    text: Quitar paralyze con:

  TextEdit
    id: paraWords
    anchors.verticalCenter: antiPara.verticalCenter
    anchors.left: antiPara.right
    anchors.right: parent.right
    margin-left: 6
    height: 20

  Label
    id: lblParaMana
    anchors.top: antiPara.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 150
    text: Mana minima

  SpinBox
    id: paraMana
    anchors.verticalCenter: lblParaMana.verticalCenter
    anchors.left: lblParaMana.right
    width: 70
    minimum: 0
    maximum: 50000
    step: 10

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local hUI = UIx.scriptPanel("War Healer")
  local hWin = UI.createWindow('WarHealerWindow', rootWidget)
  hWin:hide()

  local function trim(s) return (s or ""):match("^%s*(.-)%s*$") end

  local lastHStatus, lastActionAt = "", -1000000
  local function setHStatus(text, color)
    if text == lastHStatus then return end
    lastHStatus = text
    UIx.setLabel(hUI.status, text, color)
    UIx.setLabel(hWin.status, text, color)
  end
  local function action(text, color)
    lastActionAt = now
    setHStatus(text, color)
  end

  local spellRows = {}
  for i = 1, 3 do
    local s = hc.spells[i]
    local row = UI.createWidget('WarHealerSpellRow', hWin.spells)
    spellRows[i] = row
    row.num:setText(i .. ".")
    row.words:setText(s.words or "")
    row.hp:setValue(s.hp or 0)
    row.cd:setValue(s.cd or 0)
    row.mana:setValue(s.mana or 0)
    row.words.onTextChange = function(w, text) s.words = text end
    row.hp.onValueChange   = function(w, v) s.hp = v end
    row.cd.onValueChange   = function(w, v) s.cd = v end
    row.mana.onValueChange = function(w, v) s.mana = v end
  end

  for i = 1, 2 do
    local p = hc.potions[i]
    local row = UI.createWidget('WarHealerPotionRow', hWin.pots)
    row.num:setText(i .. ".")
    row.item:setItemId(p.id or 0)
    row.item.onItemChange = function(w) p.id = w:getItemId() end
    row.hp:setValue(p.hp or 0)
    row.hp.onValueChange = function(w, v) p.hp = v end
  end

  hWin.manaPotion:setItemId(hc.manaPotion.id or 0)
  hWin.manaPotion.onItemChange = function(w) hc.manaPotion.id = w:getItemId() end
  hWin.manaMp:setValue(hc.manaPotion.mp or 0)
  hWin.manaMp.onValueChange = function(w, v) hc.manaPotion.mp = v end

  hWin.antiPara:setChecked(hc.antiPara)
  hWin.antiPara.onCheckChange = function(w, c) hc.antiPara = c end
  hWin.paraWords:setText(hc.paraWords)
  hWin.paraWords.onTextChange = function(w, t) hc.paraWords = t end
  hWin.paraMana:setValue(hc.paraMana)
  hWin.paraMana.onValueChange = function(w, v) hc.paraMana = v end

  hWin.closeBtn.onClick = function() hWin:hide() end
  hUI.setupBtn.onClick = function() UIx.toggleWindow(hWin) end

  UIx.bindSwitch(hc, hUI.switch, hWin.enableBtn, function(v)
    if v then setHStatus("Activo", "#66ff66") else setHStatus("Inactivo", "#888888") end
  end)

  -- Presets por profesion: {palabras, HP %, cooldown s}
  -- (Knight usa los valores que ya tenias en tu servidor)
  local HEAL_PRESETS = {
    knight   = {{"exura gran ico", 19, 120}, {"exura med ico", 95, 2}, {"", 0, 0}},
    paladin  = {{"exura gran san", 60, 1},   {"exura san", 90, 1},     {"", 0, 0}},
    sorcerer = {{"exura vita", 50, 1}, {"exura gran", 75, 1}, {"exura infir", 90, 1}},
    druid    = {{"exura vita", 50, 1}, {"exura gran", 75, 1}, {"exura infir", 90, 1}},
  }
  Prof.register(function(v)
    local p = HEAL_PRESETS[v]
    if not p then
      return "Healer: sin preset para " .. Prof.name(v) .. ", escribe tus hechizos"
    end
    for i = 1, 3 do
      local s, row = hc.spells[i], spellRows[i]
      s.words, s.hp, s.cd = p[i][1], p[i][2], p[i][3]
      if row then
        row.words:setText(s.words)
        row.hp:setValue(s.hp)
        row.cd:setValue(s.cd)
      end
    end
    return "Healer: hechizos de " .. Prof.name(v)
  end)

  local NEVER = -1000000
  local lastPotion, lastHealSpell, lastPara = NEVER, NEVER, NEVER
  local lastCast, lastTry = {}, {}
  local confirmSeen = false

  local function groupCooldown(id)
    local ok, res = pcall(function()
      return modules.game_cooldown.isGroupCooldownIconActive(id)
    end)
    return ok and res == true
  end

  local globalParalyzed = isParalyzed
  local function paralyzed()
    local ok, r = pcall(function()
      if globalParalyzed then return globalParalyzed() end
      return player:hasState((PlayerStates and PlayerStates.Paralyze) or 32)
    end)
    return ok and r == true
  end

  local function myMana()
    local ok, m = pcall(function() return mana() end)
    return (ok and type(m) == "number") and m or 0
  end

  -- Cuenta en mochilas abiertas
  local function hasItem(id)
    local ok, n = pcall(function() return itemAmount(id) end)
    if ok and type(n) == "number" then return n > 0 end
    return findItem(id) ~= nil
  end

  -- Primera fila que cumpla el HP y que tengas. Si no tienes ninguna en
  -- mochilas abiertas, prueba la primera por hotkey (mochila cerrada).
  local function pickHealthPotion(hp)
    local first
    for i, p in ipairs(hc.potions) do
      if (p.id or 0) > 0 and hp <= (p.hp or 0) then
        if hasItem(p.id) then return p.id, i, false end
        first = first or i
      end
    end
    if first then return hc.potions[first].id, first, true end
  end

  onTalk(function(name, level, mode, text)
    if not player or name ~= player:getName() then return end
    local t = trim(text):lower()
    if t == "" then return end
    for _, s in ipairs(hc.spells) do
      if trim(s.words):lower() == t then
        lastCast[t] = now
        lastHealSpell = now
        confirmSeen = true
        return
      end
    end
  end)

  local function spellReady(words, cdMs)
    local last = lastCast[words] or NEVER
    if now - last < cdMs then return false end
    local retry = (cdMs >= 10000) and 1000 or 300
    if now - (lastTry[words] or NEVER) < retry then return false end
    return true
  end

  macro(100, function()
    if not hc.enabled then return end
    local hp, mp = hppercent(), manapercent()
    if not hp then return end

    -- 1) Pociones (vida primero, luego mana)
    if now - lastPotion >= POTION_RETRY and not EquipCore.holdPotion(hp) then
      local id, idx, guess = pickHealthPotion(hp)
      if id then
        useWith(id, player)
        lastPotion = now; Shared.lastSelfPotion = now
        Shared.lastUseId, Shared.lastUseAt = id, now
        if guess then
          action("Pocion " .. idx .. " (no la veo en mochilas abiertas)", "#ffcc66")
        else
          action("Pocion de vida " .. idx, "#88ff88")
        end
      else
        local m = hc.manaPotion
        if (m.id or 0) > 0 and mp and mp <= (m.mp or 0) then
          useWith(m.id, player)
          lastPotion = now; Shared.lastSelfPotion = now
          Shared.lastUseId, Shared.lastUseAt = m.id, now
          action("Pocion de mana", "#88ccff")
        end
      end
    end

    local myMp = myMana()

    -- 2) Hechizos de curacion
    --    (si un amigo esta mas bajo y lo van a curar con hechizo, esperar)
    local friendFirst = now - Shared.friendWantAt < 400 and Shared.friendWantHp < hp
    if now - lastHealSpell >= GROUP_MS and not groupCooldown(2)
       and now - Shared.lastFriendHeal >= GROUP_MS and not friendFirst then
      for i, s in ipairs(hc.spells) do
        local w = trim(s.words):lower()
        if w ~= "" and hp <= (s.hp or 0) and spellReady(w, (s.cd or 0) * 1000) then
          if (s.mana or 0) > 0 and myMp < s.mana then
            action("Sin mana para " .. w, "#ffaa44")
          else
            say(w)
            lastTry[w] = now
            Shared.lastSelfHeal = now
            if not confirmSeen then
              lastCast[w] = now
              lastHealSpell = now
            end
            action("Hechizo " .. i .. ": " .. w, "#88ff88")
            return
          end
        end
      end
    end

    -- 3) Anti-paralyze
    if hc.antiPara and now - lastPara >= PARA_RETRY and paralyzed() then
      local pw = trim(hc.paraWords)
      if pw ~= "" then
        if myMp >= (hc.paraMana or 0) then
          say(pw)
          lastPara = now
          action("Quitando paralyze", "#88ccff")
          return
        end
        action("Paralizado: sin mana para " .. pw, "#ffaa44")
      end
    end

    if now - lastActionAt > 2000 then setHStatus("Activo", "#66ff66") end
  end)
end

-- ============================================================
-- ANILLO Y AMULETO  (UNICO script de anillo + SSA)
--  - Normal / Defensa por HP, con caida brusca opcional.
--  - Si TU subes el SSA o el anillo con tu hotkey, el script lo
--    respeta durante "Respetar manual (s)" y sube tambien la otra
--    pieza de defensa.
--  - Hotkey propia opcional (ej: F5): fuerza defensa X segundos;
--    pulsarla otra vez la cancela.
-- ============================================================
do
  local RK           = "ringAmuletV2"
  local BURST_WINDOW = 500

  if type(storage[RK]) ~= "table" then
    local old = storage.ringAmuletV1
    if type(old) ~= "table" then old = storage.ringAmuletInstantV1 end
    if type(old) ~= "table" then old = {} end
    storage[RK] = {
      enabled      = old.enabled or false,
      normalRing   = old.normalRing   or 39179,
      normalAmulet = old.normalAmulet or 58195,
      defRing      = old.defRing      or 3048,
      defAmulet    = old.defAmulet    or 3081,
      defHp        = old.defHp    or 60,
      normalHp     = old.normalHp or 90,
      burst        = old.burst    or 0,
      openBags     = old.openBags ~= false,
    }
  end
  local rc = storage[RK]
  if rc.openBags == nil then rc.openBags = true end
  rc.burst     = rc.burst or 0
  rc.manualSec = rc.manualSec or 15
  rc.hotkey    = rc.hotkey or ""
  rc.hotkeySec = rc.hotkeySec or 10

  if type(storage.ringAmuletV1) == "table" then storage.ringAmuletV1.enabled = false end
  if type(storage.ringAmuletInstantV1) == "table" then storage.ringAmuletInstantV1.enabled = false end

  g_ui.loadUIFromString([[
RingAmuletV2Window < MainWindow
  !text: tr('Anillo y Amuleto')
  size: 400 584
  @onEscape: self:hide()

  VbTitle
    id: tItems
    anchors.top: parent.top
    anchors.left: parent.left
    text: Items

  Label
    id: hRing
    anchors.top: tItems.bottom
    anchors.left: parent.left
    margin-top: 6
    margin-left: 80
    width: 56
    text-align: center
    text: Anillo

  Label
    id: hAmulet
    anchors.top: hRing.top
    anchors.left: hRing.right
    margin-left: 10
    width: 56
    text-align: center
    text: Amuleto

  BotItem
    id: nRing
    anchors.top: hRing.bottom
    anchors.horizontalCenter: hRing.horizontalCenter
    margin-top: 4

  BotItem
    id: nAmulet
    anchors.top: hAmulet.bottom
    anchors.horizontalCenter: hAmulet.horizontalCenter
    margin-top: 4

  BotItem
    id: dRing
    anchors.top: nRing.bottom
    anchors.horizontalCenter: hRing.horizontalCenter
    margin-top: 6

  BotItem
    id: dAmulet
    anchors.top: nAmulet.bottom
    anchors.horizontalCenter: hAmulet.horizontalCenter
    margin-top: 6

  Label
    id: lNormal
    anchors.verticalCenter: nRing.verticalCenter
    anchors.left: parent.left
    width: 70
    color: #66ff66
    text: Normal

  Label
    id: lDef
    anchors.verticalCenter: dRing.verticalCenter
    anchors.left: parent.left
    width: 70
    color: #ff8866
    text: Defensa

  VbHint
    id: hint
    anchors.top: dRing.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Arrastra los items a cada casilla. Casilla vacia = ese slot no se cambia.

  HorizontalSeparator
    id: sep1
    anchors.top: hint.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6

  VbTitle
    id: tWhen
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Cuando cambiar

  Label
    id: lDefHp
    anchors.top: tWhen.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 230
    text: Poner defensa si HP % <=

  SpinBox
    id: defHp
    anchors.verticalCenter: lDefHp.verticalCenter
    anchors.left: lDefHp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lNormHp
    anchors.top: lDefHp.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 230
    text: Volver a normal si HP % >=

  SpinBox
    id: normalHp
    anchors.verticalCenter: lNormHp.verticalCenter
    anchors.left: lNormHp.right
    width: 45
    minimum: 1
    maximum: 100

  Label
    id: lBurst
    anchors.top: lNormHp.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 230
    text: Caida brusca de HP % (0 = apagado)

  SpinBox
    id: burst
    anchors.verticalCenter: lBurst.verticalCenter
    anchors.left: lBurst.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lManual
    anchors.top: lBurst.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 230
    text: Respetar cambio manual (s) (0 = no)

  SpinBox
    id: manualSec
    anchors.verticalCenter: lManual.verticalCenter
    anchors.left: lManual.right
    width: 45
    minimum: 0
    maximum: 600

  HorizontalSeparator
    id: sep2
    anchors.top: lManual.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  VbTitle
    id: tHot
    anchors.top: sep2.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Hotkey de defensa (opcional)

  Label
    id: lHotkey
    anchors.top: tHot.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 45
    text: Tecla:

  TextEdit
    id: hotkey
    anchors.verticalCenter: lHotkey.verticalCenter
    anchors.left: lHotkey.right
    width: 80
    height: 20
    !tooltip: tr('Ej: F5 o Ctrl+F5. Vacio = sin hotkey')

  Label
    id: lHotSec
    anchors.verticalCenter: lHotkey.verticalCenter
    anchors.left: hotkey.right
    margin-left: 12
    width: 90
    text: Duracion (s):

  SpinBox
    id: hotkeySec
    anchors.verticalCenter: lHotkey.verticalCenter
    anchors.left: lHotSec.right
    width: 45
    minimum: 1
    maximum: 120

  VbHint
    id: hHot
    anchors.top: lHotkey.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Pulsa la tecla para forzar defensa. Pulsala otra vez para cancelar.

  CheckBox
    id: openBags
    anchors.top: hHot.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Abrir mochilas cerradas para buscar los items

  CheckBox
    id: keepBag
    anchors.top: openBags.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Devolver la pieza quitada a la mochila del reemplazo

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local rUI = UIx.scriptPanel("Anillo y Amuleto")
  local rWin = UI.createWindow('RingAmuletV2Window', rootWidget)
  rWin:hide()

  local lastStatus = ""
  local function setStatus(txt, color)
    if txt ~= lastStatus then
      lastStatus = txt
      UIx.setLabel(rUI.status, txt, color)
      UIx.setLabel(rWin.status, txt, color)
    end
  end

  local function linkItem(widget, key)
    widget:setItemId(rc[key] or 0)
    widget.onItemChange = function(w) rc[key] = w:getItemId() end
  end
  linkItem(rWin.nRing, "normalRing")
  linkItem(rWin.nAmulet, "normalAmulet")
  linkItem(rWin.dRing, "defRing")
  linkItem(rWin.dAmulet, "defAmulet")

  rWin.defHp:setValue(rc.defHp)
  rWin.normalHp:setValue(rc.normalHp)
  rWin.burst:setValue(rc.burst)
  rWin.manualSec:setValue(rc.manualSec)
  rWin.hotkey:setText(rc.hotkey)
  rWin.hotkeySec:setValue(rc.hotkeySec)
  rWin.openBags:setChecked(rc.openBags)
  rWin.defHp.onValueChange     = function(w, v) rc.defHp = v end
  rWin.normalHp.onValueChange  = function(w, v) rc.normalHp = v end
  rWin.burst.onValueChange     = function(w, v) rc.burst = v end
  rWin.manualSec.onValueChange = function(w, v) rc.manualSec = v end
  rWin.hotkey.onTextChange     = function(w, t) rc.hotkey = t end
  rWin.hotkeySec.onValueChange = function(w, v) rc.hotkeySec = v end
  rWin.openBags.onCheckChange  = function(w, c) rc.openBags = c end
  EquipCore.bindKeepBag(rWin.keepBag)
  rWin.closeBtn.onClick = function() rWin:hide() end
  rUI.setupBtn.onClick = function() UIx.toggleWindow(rWin) end

  UIx.bindSwitch(rc, rUI.switch, rWin.enableBtn, function(v)
    if not v then setStatus("Inactivo", "#888888") end
  end)

  -- Logica
  local defenseMode, forcedUntil = false, 0
  local samples = {}

  local function burstDetected(hp)
    if (rc.burst or 0) <= 0 then return false end
    table.insert(samples, {t = now, hp = hp})
    while #samples > 0 and now - samples[1].t > BURST_WINDOW do
      table.remove(samples, 1)
    end
    local top = hp
    for _, s in ipairs(samples) do
      if s.hp > top then top = s.hp end
    end
    return top - hp >= rc.burst
  end

  local function normKey(s)
    local r = (s or ""):lower():gsub("%s", "")
    return r
  end
  pcall(function()
    onKeyDown(function(keys)
      if not rc.enabled then return end
      local k = normKey(rc.hotkey)
      if k == "" or normKey(keys) ~= k then return end
      if now < forcedUntil then
        forcedUntil = 0
      else
        forcedUntil = now + (rc.hotkeySec or 10) * 1000
      end
    end)
  end)

  local function step(slot, id)
    if not defenseMode and EquipCore.isManual(slot) then return false end
    return EquipCore.equip(slot, id)
  end

  macro(50, function()
    if not rc.enabled or not g_game.isOnline() then return end
    local hp = hppercent()
    if not hp then return end

    local manRing   = EquipCore.track(SlotFinger, rc.manualSec)
    local manAmulet = EquipCore.track(SlotNeck, rc.manualSec)
    if (manRing and manRing == rc.defRing) or (manAmulet and manAmulet == rc.defAmulet) then
      local secs = (rc.manualSec or 0) > 0 and rc.manualSec or (rc.hotkeySec or 10)
      forcedUntil = now + secs * 1000
    end

    local forced = now < forcedUntil
    if forced or hp <= rc.defHp or burstDetected(hp) then
      defenseMode = true
      samples = {}
    elseif hp >= rc.normalHp then
      defenseMode = false
    end

    local ringId   = defenseMode and rc.defRing   or rc.normalRing
    local amuletId = defenseMode and rc.defAmulet or rc.normalAmulet
    local missRing   = step(SlotFinger, ringId)
    local missAmulet = step(SlotNeck, amuletId)

    local txt, color
    if defenseMode then
      txt, color = forced and "DEFENSA (manual/hotkey)" or "DEFENSA", "#ff8866"
    elseif EquipCore.isManual(SlotFinger) or EquipCore.isManual(SlotNeck) then
      txt, color = "MANUAL (respetando)", "#88ccff"
    else
      txt, color = "NORMAL", "#66ff66"
    end
    -- Solo se avisa de problemas reales (sin letras amarillas al cambiar)
    local function problem(r)
      return r and (r:find("^no esta") or r:find("^mochila llena"))
    end
    local rr = EquipCore.reason[SlotFinger]
    local ra = EquipCore.reason[SlotNeck]
    if problem(rr) then
      txt, color = txt .. " | Anillo: " .. rr, "#ff6666"
    elseif problem(ra) then
      txt, color = txt .. " | Amuleto: " .. ra, "#ff6666"
    end
    setStatus(txt, color)

    if (missRing or missAmulet) and rc.openBags then
      EquipCore.openNextBag()
    end
  end)
end

-- ============================================================
-- EQUIPO AUTO (set completo: casco, amuleto, armadura, piernas,
-- botas, anillo, ammo y escudo)
-- Si "Anillo y Amuleto" esta activo, este script NO toca anillo
-- ni amuleto (se los deja a ese script).
-- Modos: WAR, CAVE, PK y PVP.
--   PK  = valores de WAR + defensa si hay un jugador con calavera
--         blanca, roja o negra en pantalla.
--   PVP = usa SUS PROPIOS sets (Ataque PvP / Defensa PvP) y cambia
--         SOLO por % de vida (no reacciona a PKs en pantalla).
--         Se configuran en el boton "Sets PvP" de la ventana.
-- ============================================================
do
  local EK           = "equipAutoV2"
  local BURST_WINDOW = 500

  local SLOTS = {
    {key = "head",   name = "Casco",  slot = SlotHead},
    {key = "neck",   name = "Amul.",  slot = SlotNeck},
    {key = "body",   name = "Armad.", slot = SlotBody},
    {key = "legs",   name = "Pier.",  slot = SlotLeg},
    {key = "feet",   name = "Botas",  slot = SlotFeet},
    {key = "finger", name = "Anillo", slot = SlotFinger},
    {key = "ammo",   name = "Ammo",   slot = SlotAmmo},
    {key = "left",   name = "Escudo", slot = SlotLeft},
  }
  local SLOT_OF = {}
  for _, s in ipairs(SLOTS) do SLOT_OF[s.key] = s.slot end
  -- Orden de cambio: armadura, casco, amuleto, piernas, botas, anillo...
  local ORDER = {"body", "head", "neck", "legs", "feet", "finger", "ammo", "left"}

  if type(storage[EK]) ~= "table" then
    storage[EK] = {
      enabled = false, mode = storage.equipMode or "war",
      attackHp = 91, holdSec = 5,
      war  = {hp = 71, drop = 15},
      cave = {hp = 61, drop = 25},
      attack  = {head = 39148, neck = 58195, body = 39147, legs = 43876,
                 feet = 34097, finger = 39179, ammo = 58132, left = 0},
      defense = {head = 39148, neck = 3081,  body = 39147, legs = 43876,
                 feet = 34097, finger = 3048,  ammo = 58132, left = 0},
    }
  end
  local ec = storage[EK]
  -- 3 modos: pk, pvp, cave. Cada uno con su set Ataque y Defensa.
  if ec.mode ~= "cave" and ec.mode ~= "pk" and ec.mode ~= "pvp" then
    ec.mode = "pk"
  end
  ec.attack, ec.defense = ec.attack or {}, ec.defense or {}   -- legado (migracion)
  ec.attackHp, ec.holdSec = ec.attackHp or 91, ec.holdSec or 5
  if ec.openBags == nil then ec.openBags = true end
  ec.manualSec = ec.manualSec or 15

  -- Valores de vida: pkcave (compartido por PK y CAVE) y pvp (propio)
  ec.pkcave = ec.pkcave or ec.war or {hp = 71, drop = 15}
  ec.pvp    = ec.pvp or {hp = 71, drop = 15}

  -- Sets por modo. PK y CAVE arrancan copiando los sets viejos; PVP los suyos.
  local function copyset(src) local t = {} if type(src)=="table" then for k,v in pairs(src) do t[k]=v end end return t end
  if type(ec.pkAttack)   ~= "table" then ec.pkAttack   = copyset(ec.attack) end
  if type(ec.pkDefense)  ~= "table" then ec.pkDefense  = copyset(ec.defense) end
  if type(ec.caveAttack) ~= "table" then ec.caveAttack = copyset(ec.attack) end
  if type(ec.caveDefense)~= "table" then ec.caveDefense= copyset(ec.defense) end
  if type(ec.pvpAttack)  ~= "table" then ec.pvpAttack  = copyset(ec.attack) end
  if type(ec.pvpDefense) ~= "table" then ec.pvpDefense = copyset(ec.defense) end

  -- helpers para elegir los sets y valores segun el modo
  local function modeAtk()  return ({pk=ec.pkAttack, cave=ec.caveAttack, pvp=ec.pvpAttack})[ec.mode] or ec.pkAttack end
  local function modeDef()  return ({pk=ec.pkDefense, cave=ec.caveDefense, pvp=ec.pvpDefense})[ec.mode] or ec.pkDefense end
  local function modeVals() return (ec.mode == "pvp") and ec.pvp or ec.pkcave end
  local function modeDetectsPk() return ec.mode == "pk" or ec.mode == "cave" end

  g_ui.loadUIFromString([[
EquipColumn < Panel
  width: 40
  height: 98

  Label
    id: name
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text-align: center

  BotItem
    id: atk
    anchors.top: name.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    margin-top: 2

  BotItem
    id: def
    anchors.top: atk.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    margin-top: 12

EquipAutoPanel < Panel
  height: 44

  Button
    id: setupBtn
    anchors.top: parent.top
    anchors.right: parent.right
    width: 48
    height: 20
    text: Config

  BotSwitch
    id: switch
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: setupBtn.left
    margin-right: 4
    height: 20
    text: Equipo Auto

  Button
    id: modeBtn
    anchors.top: switch.bottom
    anchors.left: parent.left
    anchors.right: parent.horizontalCenter
    margin-top: 3
    margin-right: 2
    height: 20
    text: Modo: WAR

  Label
    id: status
    anchors.verticalCenter: modeBtn.verticalCenter
    anchors.left: parent.horizontalCenter
    anchors.right: parent.right
    margin-left: 2
    text-align: center
    color: #888888
    text: Inactivo

EquipAutoWindow < MainWindow
  !text: tr('Equipo Auto - Sets')
  size: 440 564
  @onEscape: self:hide()

  VbTitle
    id: tSets
    anchors.top: parent.top
    anchors.left: parent.left
    text: Sets de equipo

  Label
    id: lAtk
    anchors.top: tSets.bottom
    anchors.left: parent.left
    margin-top: 28
    width: 54
    color: #66ff66
    text: Ataque

  Label
    id: lDef
    anchors.top: tSets.bottom
    anchors.left: parent.left
    margin-top: 74
    width: 54
    color: #ff8866
    text: Defensa

  Panel
    id: cols
    anchors.top: tSets.bottom
    anchors.left: lAtk.right
    anchors.right: parent.right
    margin-top: 4
    height: 98
    layout:
      type: horizontalBox
      spacing: 2

  VbHint
    id: hint
    anchors.top: cols.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Arrastra los items a cada casilla. Casilla vacia = ese slot no se toca. Si 'Anillo y Amuleto' esta activo, aqui no se cambian anillo ni amuleto. Modo PK = valores de WAR + defensa si hay un PK en pantalla. Modo PVP = sus propios sets (boton Sets PvP).

  HorizontalSeparator
    id: sep1
    anchors.top: hint.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6

  VbTitle
    id: tModes
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Poner defensa segun el modo

  Label
    id: lWar
    anchors.top: tModes.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 45
    color: #ffaa00
    text: WAR

  Label
    id: lWarHp
    anchors.verticalCenter: lWar.verticalCenter
    anchors.left: lWar.right
    width: 70
    text: HP % <=

  SpinBox
    id: warHp
    anchors.verticalCenter: lWar.verticalCenter
    anchors.left: lWarHp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lWarDrop
    anchors.verticalCenter: lWar.verticalCenter
    anchors.left: warHp.right
    margin-left: 14
    width: 115
    text: o caida brusca %

  SpinBox
    id: warDrop
    anchors.verticalCenter: lWar.verticalCenter
    anchors.left: lWarDrop.right
    width: 45
    minimum: 1
    maximum: 100

  Label
    id: lCave
    anchors.top: lWar.bottom
    anchors.left: parent.left
    margin-top: 16
    width: 45
    color: #ffaa00
    text: CAVE

  Label
    id: lCaveHp
    anchors.verticalCenter: lCave.verticalCenter
    anchors.left: lCave.right
    width: 70
    text: HP % <=

  SpinBox
    id: caveHp
    anchors.verticalCenter: lCave.verticalCenter
    anchors.left: lCaveHp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lCaveDrop
    anchors.verticalCenter: lCave.verticalCenter
    anchors.left: caveHp.right
    margin-left: 14
    width: 115
    text: o caida brusca %

  SpinBox
    id: caveDrop
    anchors.verticalCenter: lCave.verticalCenter
    anchors.left: lCaveDrop.right
    width: 45
    minimum: 1
    maximum: 100

  HorizontalSeparator
    id: sep2
    anchors.top: lCave.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  VbTitle
    id: tOpts
    anchors.top: sep2.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Opciones

  Label
    id: lAtkHp
    anchors.top: tOpts.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 200
    text: Volver a ataque si HP % >=

  SpinBox
    id: atkHp
    anchors.verticalCenter: lAtkHp.verticalCenter
    anchors.left: lAtkHp.right
    width: 45
    minimum: 1
    maximum: 100

  Label
    id: lHold
    anchors.top: lAtkHp.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: Mantener defensa minimo (s)

  SpinBox
    id: hold
    anchors.verticalCenter: lHold.verticalCenter
    anchors.left: lHold.right
    width: 45
    minimum: 1
    maximum: 60

  Label
    id: lManual
    anchors.top: lHold.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: Respetar cambio manual (s)

  SpinBox
    id: manualSec
    anchors.verticalCenter: lManual.verticalCenter
    anchors.left: lManual.right
    width: 45
    minimum: 0
    maximum: 600

  CheckBox
    id: openBags
    anchors.top: lManual.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: Abrir mochilas cerradas si no encuentra un item

  CheckBox
    id: keepBag
    anchors.top: openBags.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Devolver la pieza quitada a la mochila del reemplazo

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: modeBtn
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 110
    text: Modo: WAR

  Button
    id: pvpBtn
    anchors.bottom: parent.bottom
    anchors.left: modeBtn.right
    margin-left: 6
    width: 80
    text: Sets PvP

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar

EquipPvpWindow < MainWindow
  !text: tr('Equipo Auto - Sets PvP')
  size: 440 300
  @onEscape: self:hide()

  VbTitle
    id: tSets
    anchors.top: parent.top
    anchors.left: parent.left
    text: Sets del modo PVP

  Label
    id: lAtk
    anchors.top: tSets.bottom
    anchors.left: parent.left
    margin-top: 28
    width: 54
    color: #66ff66
    text: Ataque

  Label
    id: lDef
    anchors.top: tSets.bottom
    anchors.left: parent.left
    margin-top: 74
    width: 54
    color: #ff8866
    text: Defensa

  Panel
    id: cols
    anchors.top: tSets.bottom
    anchors.left: lAtk.right
    anchors.right: parent.right
    margin-top: 4
    height: 98
    layout:
      type: horizontalBox
      spacing: 2

  VbHint
    id: hint
    anchors.top: cols.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Estos items solo se usan en Modo: PVP. Casilla vacia = ese slot no se toca.

  HorizontalSeparator
    id: sep1
    anchors.top: hint.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6

  Label
    id: lPvp
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 45
    color: #ffaa00
    text: PVP

  Label
    id: lPvpHp
    anchors.verticalCenter: lPvp.verticalCenter
    anchors.left: lPvp.right
    width: 70
    text: HP % <=

  SpinBox
    id: pvpHp
    anchors.verticalCenter: lPvp.verticalCenter
    anchors.left: lPvpHp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lPvpDrop
    anchors.verticalCenter: lPvp.verticalCenter
    anchors.left: pvpHp.right
    margin-left: 14
    width: 115
    text: o caida brusca %

  SpinBox
    id: pvpDrop
    anchors.verticalCenter: lPvp.verticalCenter
    anchors.left: lPvpDrop.right
    width: 45
    minimum: 1
    maximum: 100

  VbHint
    id: hintPvp
    anchors.top: lPvp.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10
    text: En modo PVP el cambio es SOLO por % de vida (no reacciona a PKs).

  Button
    id: copyBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 170
    text: Copiar sets normales aqui

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local eUI = setupUI("EquipAutoPanel\n  height: 44")
  local eWin = UI.createWindow('EquipAutoWindow', rootWidget)
  eWin:hide()

  -- Ventana principal = sets del modo PK
  for _, s in ipairs(SLOTS) do
    local col = UI.createWidget('EquipColumn', eWin.cols)
    col.name:setText(s.name)
    col.atk:setItemId(ec.pkAttack[s.key] or 0)
    col.def:setItemId(ec.pkDefense[s.key] or 0)
    col.atk.onItemChange = function(w) ec.pkAttack[s.key]  = w:getItemId() end
    col.def.onItemChange = function(w) ec.pkDefense[s.key] = w:getItemId() end
  end

  -- fila WAR ahora controla los valores PK+CAVE (compartidos); fila CAVE se oculta
  eWin.warHp:setValue(ec.pkcave.hp)
  eWin.warDrop:setValue(ec.pkcave.drop)
  eWin.warHp.onValueChange     = function(w, v) ec.pkcave.hp = v end
  eWin.warDrop.onValueChange   = function(w, v) ec.pkcave.drop = v end
  pcall(function() eWin.caveHp:setVisible(false); eWin.caveDrop:setVisible(false) end)
  pcall(function() eWin.warHp:setValue(ec.pkcave.hp) end)
  eWin.atkHp:setValue(ec.attackHp)
  eWin.hold:setValue(ec.holdSec)
  eWin.manualSec:setValue(ec.manualSec)
  eWin.atkHp.onValueChange     = function(w, v) ec.attackHp = v end
  eWin.hold.onValueChange      = function(w, v) ec.holdSec = v end
  eWin.manualSec.onValueChange = function(w, v) ec.manualSec = v end
  -- etiquetas: aclarar que la fila de valores es PK+CAVE
  pcall(function() eWin.lblWar:setText("PK y CAVE  HP% <=") end)
  -- ----- Ventana "Sets de otro modo" (edita CAVE o PVP) -----
  local pWin = UI.createWindow('EquipPvpWindow', rootWidget)
  pWin:hide()
  local pvpCols = {}
  local editMode = "cave"   -- cual modo se esta editando en esta ventana
  local function setsOf(mode)
    if mode == "pvp" then return ec.pvpAttack, ec.pvpDefense, ec.pvp end
    return ec.caveAttack, ec.caveDefense, ec.pvp   -- cave no usa valores aqui
  end
  for _, s in ipairs(SLOTS) do
    local col = UI.createWidget('EquipColumn', pWin.cols)
    col.name:setText(s.name)
    col.atk.onItemChange = function(w)
      local a = (editMode=="pvp") and ec.pvpAttack or ec.caveAttack
      a[s.key] = w:getItemId()
    end
    col.def.onItemChange = function(w)
      local d = (editMode=="pvp") and ec.pvpDefense or ec.caveDefense
      d[s.key] = w:getItemId()
    end
    pvpCols[s.key] = col
  end
  local function refreshSets()
    local a = (editMode=="pvp") and ec.pvpAttack or ec.caveAttack
    local d = (editMode=="pvp") and ec.pvpDefense or ec.caveDefense
    for _, s in ipairs(SLOTS) do
      pvpCols[s.key].atk:setItemId(a[s.key] or 0)
      pvpCols[s.key].def:setItemId(d[s.key] or 0)
    end
    -- titulo y valores (solo PVP tiene valores propios aqui)
    pcall(function() pWin:setText("Equipo Auto - Sets " .. editMode:upper()) end)
    if editMode == "pvp" then
      pcall(function() pWin.pvpHp:setVisible(true); pWin.pvpDrop:setVisible(true) end)
      pWin.pvpHp:setValue(ec.pvp.hp); pWin.pvpDrop:setValue(ec.pvp.drop)
    else
      pcall(function() pWin.pvpHp:setVisible(false); pWin.pvpDrop:setVisible(false) end)
    end
  end
  pWin.pvpHp.onValueChange   = function(w, v) if editMode=="pvp" then ec.pvp.hp = v end end
  pWin.pvpDrop.onValueChange = function(w, v) if editMode=="pvp" then ec.pvp.drop = v end end
  -- el boton "copiar" ahora alterna entre editar CAVE y PVP
  pWin.copyBtn:setText("Editando: CAVE (tocar para PVP)")
  pWin.copyBtn.onClick = function()
    editMode = (editMode=="cave") and "pvp" or "cave"
    pWin.copyBtn:setText("Editando: " .. editMode:upper() .. " (tocar para cambiar)")
    refreshSets()
  end
  pWin.closeBtn.onClick = function() pWin:hide() end
  eWin.pvpBtn:setText("Sets CAVE / PVP")
  eWin.pvpBtn.onClick = function() refreshSets(); UIx.toggleWindow(pWin) end

  eWin.openBags:setChecked(ec.openBags)
  eWin.openBags.onCheckChange = function(w, c) ec.openBags = c end
  EquipCore.bindKeepBag(eWin.keepBag)

  local function updateMode()
    local txt = "Modo: " .. ec.mode:upper()
    eUI.modeBtn:setText(txt)
    eWin.modeBtn:setText(txt)
  end
  local NEXT_MODE = {pk = "pvp", pvp = "cave", cave = "pk"}
  local function toggleMode()
    ec.mode = NEXT_MODE[ec.mode] or "pk"
    updateMode()
  end
  updateMode()
  eUI.modeBtn.onClick  = toggleMode
  eWin.modeBtn.onClick = toggleMode
  eWin.closeBtn.onClick = function() eWin:hide() end
  eUI.setupBtn.onClick = function() UIx.toggleWindow(eWin) end

  local inDefense, defenseUntil = false, 0
  local samples = {}
  local lastStatus = ""

  local function setStatus(txt, color)
    if txt ~= lastStatus then
      lastStatus = txt
      UIx.setLabel(eUI.status, txt, color)
      UIx.setLabel(eWin.status, txt, color)
    end
  end

  UIx.bindSwitch(ec, eUI.switch, eWin.enableBtn, function(v)
    if not v then setStatus("Inactivo", "#888888") end
  end)

  local function ringScriptOn()
    local ra = storage.ringAmuletV2
    return type(ra) == "table" and ra.enabled == true
  end

  local function managed(key)
    return not (ringScriptOn() and (key == "finger" or key == "neck"))
  end

  local function equip(set, isDefense)
    local missing = false
    for _, key in ipairs(ORDER) do
      if managed(key) then
        local slot = SLOT_OF[key]
        if isDefense or not EquipCore.isManual(slot) then
          if EquipCore.equip(slot, set[key] or 0) then missing = true end
        end
      end
    end
    if missing and ec.openBags then EquipCore.openNextBag() end
  end

  local function burstDetected(hp, drop)
    table.insert(samples, {t = now, hp = hp})
    while #samples > 0 and now - samples[1].t > BURST_WINDOW do
      table.remove(samples, 1)
    end
    local top = hp
    for _, s in ipairs(samples) do
      if s.hp > top then top = s.hp end
    end
    return top - hp >= drop
  end

  local function eaTick()
    if not ec.enabled or not g_game.isOnline() then return end
    local hp = hppercent()
    if not hp then return end
    -- Cada modo con su set y sus valores. PK y CAVE comparten valores y
    -- ambos detectan PK en pantalla. PVP usa los suyos.
    local m = modeVals()
    local atkSet = modeAtk()
    local defSet = modeDef()
    local mTxt = ec.mode:upper()

    local manualDef = false
    for _, key in ipairs(ORDER) do
      if managed(key) then
        local mid = EquipCore.track(SLOT_OF[key], ec.manualSec)
        local d, a = defSet[key] or 0, atkSet[key] or 0
        if mid and d > 0 and d ~= a and mid == d then manualDef = true end
      end
    end
    if manualDef then
      inDefense = true
      defenseUntil = now + math.max(ec.manualSec or 0, ec.holdSec) * 1000
    end

    local pk = nil
    if modeDetectsPk() and not Shared.inPz() then
      pk = Shared.pkList()[1]
    end

    if pk or hp <= m.hp or burstDetected(hp, m.drop) then
      inDefense = true
      defenseUntil = now + ec.holdSec * 1000
      samples = {}
    end

    if inDefense then
      local dTxt = "DEFENSA " .. mTxt
      setStatus(pk and (dTxt .. " (PK: " .. (pk:getName() or "?") .. ")") or dTxt, "#ff8866")
      equip(defSet, true)
      if now < defenseUntil or hp < ec.attackHp then return end
      inDefense = false
    end

    if hp >= ec.attackHp then
      setStatus("ATAQUE " .. mTxt, "#66ff66")
      equip(atkSet, false)
    end
  end
  macro(50, eaTick)
  EquipCore.addKick(eaTick)
  -- Reaccionar en el mismo instante en que baja/sube la vida
  pcall(function()
    onPlayerHealthChange(function() eaTick() end)
  end)
end

end -- fin: 3. HP
endSection(__sec)

-- #####################################################################
-- 4. TOOLS - Utito, War Chase, Autosell
-- #####################################################################
__sec = startSection("Tools")
do
setDefaultTab("Tools")
UIx.header("COMBATE Y UTILIDADES")

-- ------------------------------------------------------------
-- BUFF DE ATAQUE (antes "Utito Tempo", con ventana)
--  - Knight: utito tempo. Paladin: utito tempo san.
--    Sorcerer/Druid no tienen: al aplicar el perfil se apaga.
--  - Palabras, duracion y mana configurables.
--  - Nunca en PZ.
--  - Opcional: solo en combate, y pausa con HP bajo para dejarle
--    la mana al War Healer.
-- ------------------------------------------------------------
do
  local UK = "utitoV2"
  if type(storage[UK]) ~= "table" then
    storage[UK] = {
      enabled = false, words = "utito tempo", duration = 10, mana = 290,
      onlyCombat = false, combatRange = 3, minHp = 0,
    }
  end
  local uc = storage[UK]
  uc.words       = uc.words or "utito tempo"
  uc.duration    = uc.duration or 10
  uc.mana        = uc.mana or 290
  uc.combatRange = uc.combatRange or 3
  uc.minHp       = uc.minHp or 0
  if uc.onlyCombat == nil then uc.onlyCombat = false end

  g_ui.loadUIFromString([[
UtitoWindow < MainWindow
  !text: tr('Buff de ataque')
  size: 400 440
  @onEscape: self:hide()

  VbTitle
    id: tSpell
    anchors.top: parent.top
    anchors.left: parent.left
    text: Hechizo

  Label
    id: lWords
    anchors.top: tSpell.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 70
    text: Palabras:

  TextEdit
    id: words
    anchors.verticalCenter: lWords.verticalCenter
    anchors.left: lWords.right
    anchors.right: parent.right
    height: 20

  Label
    id: lDur
    anchors.top: lWords.bottom
    anchors.left: parent.left
    margin-top: 16
    width: 220
    text: Duracion del efecto (s)

  SpinBox
    id: duration
    anchors.verticalCenter: lDur.verticalCenter
    anchors.left: lDur.right
    width: 50
    minimum: 1
    maximum: 600

  VbHint
    id: hDur
    anchors.top: lDur.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Pon 1 segundo menos que la duracion real para que lo renueve antes de que se acabe.

  HorizontalSeparator
    id: sep1
    anchors.top: hDur.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tCond
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Condiciones

  Label
    id: lMana
    anchors.top: tCond.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 200
    text: Mana minima para tirarlo

  SpinBox
    id: mana
    anchors.verticalCenter: lMana.verticalCenter
    anchors.left: lMana.right
    width: 70
    minimum: 0
    maximum: 50000
    step: 10

  Label
    id: lHp
    anchors.top: lMana.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: No usar si HP % <= (0 = no)

  SpinBox
    id: minHp
    anchors.verticalCenter: lHp.verticalCenter
    anchors.left: lHp.right
    width: 50
    minimum: 0
    maximum: 100

  CheckBox
    id: onlyCombat
    anchors.top: lHp.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: Solo en combate

  Label
    id: lRange
    anchors.top: onlyCombat.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 200
    text: Monstruo cerca a (sqm)

  SpinBox
    id: combatRange
    anchors.verticalCenter: lRange.verticalCenter
    anchors.left: lRange.right
    width: 50
    minimum: 1
    maximum: 10

  VbHint
    id: hCombat
    anchors.top: lRange.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: En combate = estas atacando a alguien o hay un monstruo a esa distancia. Nunca se usa en zona protegida (PZ).

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local uUI = UIx.scriptPanel("Buff de ataque")
  local uWin = UI.createWindow('UtitoWindow', rootWidget)
  uWin:hide()

  local function trim(s) return (s or ""):match("^%s*(.-)%s*$") end

  local lastUStatus = ""
  local function setUStatus(text, color)
    if text == lastUStatus then return end
    lastUStatus = text
    UIx.setLabel(uUI.status, text, color)
    UIx.setLabel(uWin.status, text, color)
  end

  uWin.words:setText(uc.words)
  uWin.words.onTextChange = function(w, t) uc.words = t end
  uWin.duration:setValue(uc.duration)
  uWin.duration.onValueChange = function(w, v) uc.duration = v end
  uWin.mana:setValue(uc.mana)
  uWin.mana.onValueChange = function(w, v) uc.mana = v end
  uWin.minHp:setValue(uc.minHp)
  uWin.minHp.onValueChange = function(w, v) uc.minHp = v end
  uWin.onlyCombat:setChecked(uc.onlyCombat)
  uWin.onlyCombat.onCheckChange = function(w, c) uc.onlyCombat = c end
  uWin.combatRange:setValue(uc.combatRange)
  uWin.combatRange.onValueChange = function(w, v) uc.combatRange = v end
  uWin.closeBtn.onClick = function() uWin:hide() end
  uUI.setupBtn.onClick = function() UIx.toggleWindow(uWin) end

  local applyU = UIx.bindSwitch(uc, uUI.switch, uWin.enableBtn, function(v)
    if v then setUStatus("Activo", "#66ff66") else setUStatus("Inactivo", "#888888") end
  end)

  local BUFF_PRESETS = {knight = "utito tempo", paladin = "utito tempo san"}
  Prof.register(function(v)
    local w = BUFF_PRESETS[v]
    if w then
      uc.words = w
      uWin.words:setText(w)
      return "Buff: " .. w
    end
    if uc.enabled then applyU(false) end
    return "Buff: " .. Prof.name(v) .. " sin buff conocido (apagado)"
  end)

  local lastUtito, lastTry, confirmSeen = -1000000, -1000000, false

  local function inPz()
    local ok, res = pcall(function()
      if isInPz then return isInPz() end
      return player:hasState((PlayerStates and PlayerStates.Pz) or 16384)
    end)
    return ok and res == true
  end

  local function inCombat()
    if g_game.isAttacking() then return true end
    local me = pos()
    if not me then return false end
    for _, spec in ipairs(getSpectators()) do
      if spec:isMonster() then
        local sp = spec:getPosition()
        if sp and sp.z == me.z and
           math.max(math.abs(sp.x - me.x), math.abs(sp.y - me.y)) <= uc.combatRange then
          return true
        end
      end
    end
    return false
  end

  onTalk(function(name, level, mode, text)
    if player and name == player:getName()
       and trim(text):lower() == trim(uc.words):lower() then
      lastUtito = now
      confirmSeen = true
    end
  end)

  macro(200, function()
    if not uc.enabled or not g_game.isOnline() then return end
    local words = trim(uc.words)
    if words == "" then
      setUStatus("Escribe las palabras en Config", "#ffaa44")
      return
    end
    if inPz() then
      setUStatus("En PZ", "#aaaaaa")
      return
    end

    local left = uc.duration * 1000 - (now - lastUtito)
    if left > 0 then
      setUStatus("Activo - renueva en " .. math.ceil(left / 1000) .. "s", "#66ff66")
      return
    end
    if uc.onlyCombat and not inCombat() then
      setUStatus("Esperando combate", "#aaaaaa")
      return
    end
    local hp = hppercent()
    if (uc.minHp or 0) > 0 and hp and hp <= uc.minHp then
      setUStatus("Pausa: HP bajo", "#ffaa44")
      return
    end
    if (uc.mana or 0) > 0 and mana() < uc.mana then
      setUStatus("Esperando mana (" .. uc.mana .. ")", "#ffcc66")
      return
    end
    if now - lastTry < 1000 then return end
    if not Shared.supportReady() then
      setUStatus("Esperando exhaust de soporte", "#aaaaaa")
      return
    end

    say(words)
    lastTry = now
    Shared.lastSupport = now
    if not confirmSeen then lastUtito = now end
    setUStatus("Lanzando " .. words, "#88ff88")
  end)
end

-- ------------------------------------------------------------
-- WAR CHASE (PvP) - 3 modos
--  Un boton que rota: NORMAL -> CON PISOS -> STOP.
--   NORMAL   : te acerca y sigue al jugador que atacas en tu mismo piso.
--   CON PISOS: ademas lo sigue si cambia de piso (escaleras, rampas,
--              rope y agujeros). Opcion de no seguir si hay 2+ PKs arriba.
--   STOP     : no lo persigue.
--  Knight/Monk se pegan; Paladin/magos solo se acercan.
-- ------------------------------------------------------------
do
  local WK = "warChaseV3"
  local DEF = {mode = 1, rangedDist = 4}
  if type(storage[WK]) ~= "table" then storage[WK] = {} end
  local wc = storage[WK]
  for k, v in pairs(DEF) do if wc[k] == nil then wc[k] = v end end

  local M_NORMAL, M_FLOORS, M_STOP = 1, 2, 3
  local MODE_TXT = {
    [M_NORMAL] = "Modo: NORMAL (mismo piso)",
    [M_FLOORS] = "Modo: CON PISOS (sigue por gradas/escaleras)",
    [M_STOP]   = "Modo: STOP (no persigue)",
  }
  local MODE_COL = {[M_NORMAL]="#66ff66", [M_FLOORS]="#66ccff", [M_STOP]="#888888"}

  local CHASE, STAND = 1, 0
  local active, prevMode = false, nil
  local lastStep, lastFloor = -1000000, -1000000
  local wcTarget, lostAt = nil, 0

  UIx.header("WAR CHASE PvP")
  local cUI = UIx.scriptPanel("War Chase")
  cUI.switch:setVisible(false)
  local modeBtn = cUI.setupBtn
  modeBtn:setText("Cambiar modo")
  local function showMode() UIx.setLabel(cUI.status, MODE_TXT[wc.mode], MODE_COL[wc.mode]) end
  showMode()
  modeBtn.onClick = function() wc.mode = wc.mode % 3 + 1; showMode() end

  local function setChase(m)
    pcall(function() if g_game.getChaseMode() ~= m then g_game.setChaseMode(m) end end)
  end
  local function followOf()
    local c; pcall(function() c = g_game.getFollowingCreature() end); return c
  end
  local function doFollow(cr)
    pcall(function() g_game.follow(cr) end)
  end
  local function cancelFollow()
    if followOf() then pcall(function() g_game.cancelFollow() end) end
  end

  -- idea: TU atacas normal. Cuando el objetivo cambia de piso, el bot hace
  -- un "toque de follow" del juego sobre ese mismo jugador: el servidor te
  -- sube/baja la grada o escalera siguiendolo (como el follow manual).
  -- Apenas vuelves a estar en su piso, se quita el follow y sigues atacando.
  local following = false
  local sameFloorAt = 0

  macro(150, "War Chase PvP (modos)", function()
    if wc.mode == M_STOP then
      if active then active = false; setChase(prevMode or STAND); cancelFollow(); following=false end
      if wcTarget then Shared.followTarget = nil; wcTarget = nil end
      return
    end

    local t = g_game.getAttackingCreature()
    if not (t and t:isPlayer()) then
      -- No hay ataque ahora. Puede ser: (a) cambio de piso (nil por un
      -- instante) o (b) murio/kill/desaparecio. Damos una gracia corta:
      -- seguimos yendo a su ultima posicion un ratito; si no reaparece,
      -- soltamos (asi no regresa al mismo lugar para siempre).
      if wcTarget then
        if lostAt == 0 then lostAt = now end
        if now - lostAt < 1500 and wc.mode == M_FLOORS and Shared.FollowEngine then
          Shared.FollowEngine.chase(nil)   -- termina de cruzar la escalera
          UIx.setLabel(cUI.status, "Enemigo fuera de vista...", "#ffaa44")
          return
        end
        -- se acabo la gracia: soltar todo
        Shared.followTarget = nil; wcTarget = nil
      end
      lostAt = 0
      if active then
        active=false; setChase(prevMode or STAND)
        following=false; cancelFollow()
      end
      return
    end
    lostAt = 0   -- hay enemigo: reiniciar el contador de gracia

    if not active then active=true; prevMode=g_game.getChaseMode() end

    -- UNIFICADO con el follow MC: en modo CON PISOS marcamos al enemigo
    -- como objetivo del motor DESDE YA, para que guarde su posicion cada
    -- 20 ms (igual que el Auto Follow MC) y lo siga por gradas/escaleras.
    if wc.mode == M_FLOORS then
      Shared.followTarget = t
      wcTarget = t
    else
      if wcTarget then Shared.followTarget = nil; wcTarget = nil end
    end

    local me, tp = pos(), t:getPosition()
    if not (me and tp) then return end

    if me.z == tp.z then
      -- MISMO PISO: solo CHASE + ataque (SIN follow del juego, que estorbaba
      -- los golpes). Guardamos su posicion para la transicion, pero no
      -- activamos follow aqui.
      sameFloorAt = now
      following = false
      -- quitar cualquier follow activo para que peguen los hits
      pcall(function() if g_game.getFollowingCreature() then g_game.cancelFollow() end end)
      setChase(Prof.isMelee() and CHASE or STAND)
      -- recordar su posicion (para cuando cambie de piso) sin hacer follow
      pcall(function()
        if Shared.FollowEngine and Shared.FollowEngine.remember then
          Shared.FollowEngine.remember(tp)
        end
      end)
      -- adelantar 1 sqm hacia el enemigo para seguirlo de inmediato
      local dd = math.max(math.abs(me.x-tp.x), math.abs(me.y-tp.y))
      if dd > 1 and not player:isWalking() and now - lastStep >= 150 then
        lastStep = now
        local dx=(tp.x>me.x) and 1 or (tp.x<me.x) and -1 or 0
        local dy=(tp.y>me.y) and 1 or (tp.y<me.y) and -1 or 0
        pcall(function() if walk then walk({x=me.x+dx, y=me.y+dy, z=me.z}) end end)
      end
      UIx.setLabel(cUI.status, MODE_TXT[wc.mode], MODE_COL[wc.mode])
    else
      -- objetivo en OTRO piso
      if wc.mode == M_FLOORS and Shared.FollowEngine then
        Shared.FollowEngine.chase(t)
        following = true
        UIx.setLabel(cUI.status, "Siguiendo por piso al enemigo...", "#66ccff")
      else
        if following then cancelFollow(); following=false end
        UIx.setLabel(cUI.status, MODE_TXT[wc.mode], MODE_COL[wc.mode])
      end
    end
  end)
end
-- ------------------------------------------------------------
-- AUTOSELL (cada 60 s, tambien en combate)
-- ------------------------------------------------------------
do
  local SELL = {itemId = 58183, intervalMs = 60000}
  local lastSell = -1000000

  macro(1000, "Autosell (cada 60 s)", function()
    if not g_game.isOnline() then return end
    if now - lastSell < SELL.intervalMs then return end
    lastSell = now
    local item = findItem(SELL.itemId)
    if item then
      use(item)
    else
      pcall(function() g_game.useInventoryItem(SELL.itemId) end)
    end
  end)
end

end -- fin: 4. TOOLS
endSection(__sec)

-- #####################################################################
-- 5. CAVE - Dynamic Lure (con ventana)
--  - Mientras haya MENOS mobs que "Parar con", el cavebot sigue
--    caminando despacio (frenadas cortas) para juntar mas (lure).
--  - Al llegar a "Parar con" mobs alcanzables, frena el cavebot y
--    pelea con chase hasta que queden "Seguir con" o menos.
--  - Si el grupo no se puede alcanzar durante un tiempo, lo suelta.
--  - Nunca cambia de objetivo si estas atacando a un jugador.
--  - Chase al pelear: automatico segun la profesion (Knight/Monk si,
--    Paladin/magos no) o lo marcas a mano en Config.
-- #####################################################################
__sec = startSection("Cave")
do
setDefaultTab("Cave")
UIx.header("LURE")

do
  local LK            = "dynamicLureV9"
  local CHECK_MS      = 150
  local PATH_CACHE_MS = 600

  local LURE_DEFAULTS = {
    detectRange          = 10,
    stopAt               = 6,
    resumeAt             = 1,
    slowInterval         = 1000,
    slowDelay            = 250,
    stopDelay            = 500,
    blockedTimeout       = 2000,
    maxPathChecks        = 6,
    attackWithoutCaveBot = true,
    ignoreNames          = "",
    targetMode           = "high",   -- high = mas vida, low = menos vida, near = mas cercano
  }

  if type(storage[LK]) ~= "table" then storage[LK] = {enabled = false} end
  local lc = storage[LK]
  if lc.enabled == nil then lc.enabled = false end
  for k, v in pairs(LURE_DEFAULTS) do
    if lc[k] == nil then lc[k] = v end
  end
  -- Mascota de la guild: se agrega una sola vez a la lista de ignorados
  if not lc.petAdded then
    lc.petAdded = true
    local cur = lc.ignoreNames or ""
    if not cur:lower():find("alebrije", 1, true) then
      lc.ignoreNames = (cur:match("^%s*$") and "" or (cur .. ", ")) .. "Alebrije"
    end
  end

  g_ui.loadUIFromString([[
DynamicLureWindow < MainWindow
  !text: tr('Dynamic Lure')
  size: 420 700
  @onEscape: self:hide()

  VbTitle
    id: tStop
    anchors.top: parent.top
    anchors.left: parent.left
    text: Cuando parar a pelear

  Label
    id: lRange
    anchors.top: tStop.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 240
    text: Rango para contar monstruos (sqm)

  SpinBox
    id: detectRange
    anchors.verticalCenter: lRange.verticalCenter
    anchors.left: lRange.right
    width: 55
    minimum: 1
    maximum: 15

  Label
    id: lStopAt
    anchors.top: lRange.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 240
    text: Parar y pelear con X mobs o mas

  SpinBox
    id: stopAt
    anchors.verticalCenter: lStopAt.verticalCenter
    anchors.left: lStopAt.right
    width: 55
    minimum: 1
    maximum: 30

  Label
    id: lResumeAt
    anchors.top: lStopAt.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 240
    text: Seguir caminando con X mobs o menos

  SpinBox
    id: resumeAt
    anchors.verticalCenter: lResumeAt.verticalCenter
    anchors.left: lResumeAt.right
    width: 55
    minimum: 0
    maximum: 29

  VbHint
    id: hStop
    anchors.top: lResumeAt.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Con menos mobs que el limite, el CaveBot sigue caminando despacio para juntar mas. "Seguir con" debe ser menor que "Parar con".

  HorizontalSeparator
    id: sep1
    anchors.top: hStop.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tSpeed
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Velocidad del CaveBot

  Label
    id: lSlowDelay
    anchors.top: tSpeed.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 240
    text: Frenada al lurear (ms) (0 = no)

  SpinBox
    id: slowDelay
    anchors.verticalCenter: lSlowDelay.verticalCenter
    anchors.left: lSlowDelay.right
    width: 55
    minimum: 0
    maximum: 2000
    step: 50

  Label
    id: lSlowInterval
    anchors.top: lSlowDelay.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 240
    text: Frenar cada (ms)

  SpinBox
    id: slowInterval
    anchors.verticalCenter: lSlowInterval.verticalCenter
    anchors.left: lSlowInterval.right
    width: 55
    minimum: 200
    maximum: 5000
    step: 100

  Label
    id: lStopDelay
    anchors.top: lSlowInterval.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 240
    text: Pausa del CaveBot al pelear (ms)

  SpinBox
    id: stopDelay
    anchors.verticalCenter: lStopDelay.verticalCenter
    anchors.left: lStopDelay.right
    width: 55
    minimum: 100
    maximum: 2000
    step: 50

  HorizontalSeparator
    id: sep2
    anchors.top: lStopDelay.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  VbTitle
    id: tAdv
    anchors.top: sep2.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Avanzado

  Label
    id: lBlocked
    anchors.top: tAdv.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 240
    text: Soltar grupo si no se alcanza (ms)

  SpinBox
    id: blockedTimeout
    anchors.verticalCenter: lBlocked.verticalCenter
    anchors.left: lBlocked.right
    width: 55
    minimum: 500
    maximum: 10000
    step: 250

  Label
    id: lPaths
    anchors.top: lBlocked.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 240
    text: Caminos a revisar por ciclo

  SpinBox
    id: maxPathChecks
    anchors.verticalCenter: lPaths.verticalCenter
    anchors.left: lPaths.right
    width: 55
    minimum: 1
    maximum: 20

  CheckBox
    id: attackWithoutCaveBot
    anchors.top: lPaths.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: Atacar aunque el CaveBot este apagado

  CheckBox
    id: useChase
    anchors.top: attackWithoutCaveBot.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Seguir al monstruo (chase) al pelear
    !tooltip: tr('Recomendado solo para Knight/Monk. Por defecto segun la profesion.')

  Button
    id: targetMode
    anchors.top: useChase.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    height: 22
    !tooltip: tr('A quien ataca de los monstruos pegados a ti. Toca para cambiar.')

  HorizontalSeparator
    id: sep3
    anchors.top: targetMode.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tIgnore
    anchors.top: sep3.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Monstruos a ignorar

  TextEdit
    id: ignoreNames
    anchors.top: tIgnore.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 22
    !tooltip: tr('Ej: rat, cave rat, bug')

  VbHint
    id: hIgnore
    anchors.top: ignoreNames.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Nombres separados por coma. No se cuentan ni se atacan. Lo que va entre [ ] se ignora (Alebrije [Lvl.xx] = Alebrije). Mascotas e invocaciones se ignoran solas.

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: resetBtn
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 120
    text: Valores por defecto

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local lUI = UIx.scriptPanel("Dynamic Lure")
  local lWin = UI.createWindow('DynamicLureWindow', rootWidget)
  lWin:hide()

  local lastLStatus = ""
  local function setLStatus(text, color)
    if text == lastLStatus then return end
    lastLStatus = text
    UIx.setLabel(lUI.status, text, color)
    UIx.setLabel(lWin.status, text, color)
  end

  -- Enlazar la ventana con la configuracion
  local SPINS = {"detectRange", "stopAt", "resumeAt", "slowDelay", "slowInterval",
                 "stopDelay", "blockedTimeout", "maxPathChecks"}

  -- nil = automatico segun la profesion
  local function wantChase()
    if lc.useChase == nil then return Prof.isMelee() end
    return lc.useChase == true
  end

  -- Prioridad de objetivo
  local TARGET_TEXT = {
    high = "Objetivo: el de MAS vida",
    low  = "Objetivo: el de MENOS vida",
    near = "Objetivo: el MAS cercano",
  }
  local TARGET_NEXT = {high = "low", low = "near", near = "high"}

  local loading = false
  local function loadWindow()
    loading = true
    lWin.useChase:setChecked(wantChase())
    loading = false
    for _, key in ipairs(SPINS) do lWin[key]:setValue(lc[key]) end
    lWin.attackWithoutCaveBot:setChecked(lc.attackWithoutCaveBot)
    lWin.ignoreNames:setText(lc.ignoreNames or "")
    lWin.targetMode:setText(TARGET_TEXT[lc.targetMode] or TARGET_TEXT.high)
  end

  loadWindow()
  for _, key in ipairs(SPINS) do
    lWin[key].onValueChange = function(w, v) lc[key] = v end
  end
  lWin.attackWithoutCaveBot.onCheckChange = function(w, c) lc.attackWithoutCaveBot = c end
  lWin.ignoreNames.onTextChange = function(w, t) lc.ignoreNames = t end
  lWin.useChase.onCheckChange = function(w, c)
    if not loading then lc.useChase = c end
  end
  lWin.targetMode.onClick = function(w)
    lc.targetMode = TARGET_NEXT[lc.targetMode] or "high"
    w:setText(TARGET_TEXT[lc.targetMode])
  end

  Prof.register(function(v)
    lc.useChase = nil
    loadWindow()
    return "Lure: chase " .. (Prof.isMelee() and "SI" or "NO")
  end)

  lWin.resetBtn.onClick = function()
    for k, v in pairs(LURE_DEFAULTS) do lc[k] = v end
    lc.useChase = nil
    loadWindow()
  end
  lWin.closeBtn.onClick = function() lWin:hide() end
  lUI.setupBtn.onClick = function() UIx.toggleWindow(lWin, loadWindow) end

  -- Logica
  local fightingGroup, lastSlow, blockedSince = false, 0, 0
  local pathCache, lastCacheClean = {}, 0
  local ignoreCache, ignoreText = {}, nil

  local function getDist(a, b)
    if not a or not b or a.z ~= b.z then return 99 end
    return math.max(math.abs(a.x - b.x), math.abs(a.y - b.y))
  end

  local function posKey(p) return p.x .. "," .. p.y .. "," .. p.z end

  local function ignoreSet()
    local txt = lc.ignoreNames or ""
    if txt ~= ignoreText then
      ignoreText, ignoreCache = txt, {}
      for name in txt:gmatch("[^,]+") do
        local n = (name:match("^%s*(.-)%s*$") or ""):lower()
        if n ~= "" then ignoreCache[n] = true end
      end
    end
    return ignoreCache
  end

  local function isReachable(fromPos, creature, toPos, dist)
    if dist <= 1 then return true end
    if dist >= 99 then return false end
    local id, key = creature:getId(), posKey(fromPos) .. ">" .. posKey(toPos)
    local c = pathCache[id]
    if c and c.key == key and now - c.t < PATH_CACHE_MS then return c.ok end
    local path = findPath(fromPos, toPos, lc.detectRange,
      {ignoreNonPathable = false, precision = 1})
    local ok = path ~= nil and #path > 0
    pathCache[id] = {key = key, t = now, ok = ok}
    return ok
  end

  local function chaseOn()
    if g_game.getChaseMode() ~= 1 then g_game.setChaseMode(1) end
  end
  local function chaseOff()
    if g_game.getChaseMode() ~= 0 then g_game.setChaseMode(0) end
  end

  local ready = false
  UIx.bindSwitch(lc, lUI.switch, lWin.enableBtn, function(v)
    fightingGroup, blockedSince, lastSlow = false, 0, 0
    pathCache = {}
    if v then
      setLStatus("Activo", "#66ff66")
    else
      -- Al apagarlo a mano deja el chase en "quieto"
      if ready then pcall(chaseOff) end
      setLStatus("Inactivo", "#888888")
    end
  end)
  ready = true

  macro(CHECK_MS, function()
    if not lc.enabled or not g_game.isOnline() then return end
    local me = player:getPosition()
    if not me then return end

    local current = g_game.getAttackingCreature()
    if current and current:isPlayer() then
      setLStatus("Pausa: atacando a un jugador", "#ffcc66")
      return
    end
    -- Nunca atacar a la mascota / invocaciones / ignorados
    if current and current:isMonster() and Shared.isIgnoredMob(current) then
      g_game.cancelAttack()
      current = nil
    end

    if now - lastCacheClean > 5000 then
      lastCacheClean = now
      for id, c in pairs(pathCache) do
        if now - c.t > 5000 then pathCache[id] = nil end
      end
    end

    local range    = lc.detectRange or 10
    local stopAt   = math.max(1, lc.stopAt or 6)
    local resumeAt = math.min(lc.resumeAt or 1, stopAt - 1)

    local mobs = {}
    for _, cr in ipairs(getSpectators()) do
      if cr:isMonster() and not Shared.isIgnoredMob(cr) then
        local cp = cr:getPosition()
        local hp = cr:getHealthPercent()
        if cp and hp > 0 then
          local d = getDist(me, cp)
          if d <= range then
            table.insert(mobs, {cr = cr, pos = cp, dist = d, hp = hp})
          end
        end
      end
    end
    table.sort(mobs, function(a, b) return a.dist < b.dist end)

    local visibleCount = #mobs
    local bestAdjacent, bestAdjacentHP, closestReachable = nil, -1, nil
    local checks = 0
    local mode = lc.targetMode or "high"

    -- Puntaje: mayor = mejor objetivo segun el modo
    local function score(m)
      if mode == "low" then return 100 - m.hp end
      if mode == "near" then return 0 end   -- ya estan ordenados por distancia
      return m.hp
    end
    local curAdj, curScore = nil, -1

    for _, m in ipairs(mobs) do
      if m.dist <= 1 then
        local sc = score(m)
        if sc > bestAdjacentHP then
          bestAdjacentHP, bestAdjacent = sc, m.cr
        end
        if current and m.cr:getId() == current:getId() then
          curAdj, curScore = m.cr, sc
        end
        closestReachable = closestReachable or m.cr
      elseif not closestReachable then
        if checks >= (lc.maxPathChecks or 6) then break end
        checks = checks + 1
        if isReachable(me, m.cr, m.pos, m.dist) then closestReachable = m.cr end
      else
        break
      end
    end

    local hasReachable = closestReachable ~= nil

    if not fightingGroup and visibleCount >= stopAt and hasReachable then
      fightingGroup, blockedSince = true, 0
    end
    if fightingGroup and visibleCount <= resumeAt then
      fightingGroup, blockedSince = false, 0
      chaseOff()
    end

    if fightingGroup then
      if hasReachable then
        blockedSince = 0
      else
        if blockedSince == 0 then blockedSince = now end
        if now - blockedSince >= (lc.blockedTimeout or 2000) then
          fightingGroup, blockedSince = false, 0
          chaseOff()
        end
      end
    else
      blockedSince = 0
    end

    -- No cambiar por poco: si el objetivo actual esta pegado y la
    -- diferencia es menor a 10% de vida, se queda con el (evita saltar
    -- de un monstruo a otro todo el tiempo).
    if curAdj and bestAdjacent and bestAdjacentHP - curScore < 10 then
      bestAdjacent = curAdj
    end

    local wantedTarget = bestAdjacent or closestReachable
    local caveOn = CaveBot and CaveBot.isOn and CaveBot.isOn()

    if caveOn then
      if fightingGroup then
        CaveBot.delay(lc.stopDelay or 500)
        if wantedTarget and wantChase() then chaseOn() else chaseOff() end
      elseif visibleCount >= 1 and visibleCount < stopAt then
        chaseOff()
        if (lc.slowDelay or 0) > 0 and
           (lastSlow == 0 or now - lastSlow >= (lc.slowInterval or 1000)) then
          CaveBot.delay(lc.slowDelay)
          lastSlow = now
        end
      else
        chaseOff()
        lastSlow = 0
      end
    end

    -- Estado
    local txt, color
    if fightingGroup then
      if hasReachable then
        txt, color = "PELEANDO: " .. visibleCount .. " mobs (sigue con <= " .. resumeAt .. ")", "#ff8866"
      else
        txt, color = "Grupo no alcanzable...", "#ffaa44"
      end
    elseif visibleCount > 0 then
      txt, color = "Lureando: " .. visibleCount .. "/" .. stopAt .. " mobs", "#66ff66"
    else
      txt, color = "Buscando mobs", "#aaaaaa"
    end
    if not caveOn then
      txt = txt .. " | CaveBot apagado"
      if not lc.attackWithoutCaveBot then color = "#aaaaaa" end
    end
    setLStatus(txt, color)

    if not caveOn and not lc.attackWithoutCaveBot then return end

    if wantedTarget then
      if current and current:getId() == wantedTarget:getId() then return end
      g_game.attack(wantedTarget)
    elseif current and current:isMonster() then
      local cp = current:getPosition()
      if cp and not isReachable(me, current, cp, getDist(me, cp)) then
        g_game.cancelAttack()
      end
    end
  end)
end

end -- fin: 5. CAVE
endSection(__sec)

-- #####################################################################
-- 6. HP - Party Support (UH, mana y hechizo para amigos)
--  - Sirve para todas las profesiones (antes "EK Support").
--  - Runa de curacion (UH), pocion de mana y hechizo de curar amigo
--    (ej: exura sio "{name}" para Druid).
--  - Ayuda a party, a los de tu GUILD (por el emblema) y a la lista.
--  - Boton "Hechizos y boost": hechizo de curar amigo y BOOST a la
--    guild por turnos (ej: exura boost "{name}"): se lo lanza a cada
--    compañero en rotacion y recuerda a quien ya se lo dio.
--  - En la casilla de "Vida del amigo" puedes poner runa UH o pocion.
-- #####################################################################
__sec = startSection("HP")
do
setDefaultTab("HP")
UIx.header("APOYO A AMIGOS")

local EKS = "ekFriendSupportV2"

if type(storage[EKS]) ~= "table" then
  storage[EKS] = {
    enabled = false,
    helpParty = true,
    maxDist = 5,
    mySafeHp = 40,
    uhId = 3160,
    uhHp = 60,
    manaPotId = 238,
    manaPotMp = 40,
    customNames = ""
  }
end
local ec = storage[EKS]
-- Antes "Solo party" impedia ayudar a los nombres de la lista.
-- Ahora: los nombres de la lista se ayudan siempre.
if ec.helpParty == nil then ec.helpParty = true end
if ec.sioEnabled == nil then ec.sioEnabled = false end
ec.sioWords = ec.sioWords or 'exura sio "{name}"'
ec.sioHp    = ec.sioHp or 70
ec.sioMana  = ec.sioMana or 140
if ec.helpGuild == nil then ec.helpGuild = true end
if ec.boostEnabled == nil then ec.boostEnabled = false end
ec.boostWords = ec.boostWords or 'exura boost "{name}"'
ec.boostEvery = ec.boostEvery or 60
ec.boostGap   = ec.boostGap or 2
ec.boostMana  = ec.boostMana or 100

g_ui.loadUIFromString([[
EKSupportWindow < MainWindow
  !text: tr('Party Support')
  size: 400 430
  @onEscape: self:hide()

  VbTitle
    id: tWho
    anchors.top: parent.top
    anchors.left: parent.left
    text: A quien ayudar

  CheckBox
    id: helpParty
    anchors.top: tWho.bottom
    anchors.left: parent.left
    margin-top: 4
    width: 150
    text: Mi party

  CheckBox
    id: helpGuild
    anchors.top: tWho.bottom
    anchors.left: helpParty.right
    anchors.right: parent.right
    margin-top: 4
    text: Mi guild (emblema)

  Label
    id: lblNames
    anchors.top: helpParty.bottom
    anchors.left: parent.left
    margin-top: 6
    text-auto-resize: true
    text: Amigos por nombre (coma), van primero:

  TextEdit
    id: customNames
    anchors.top: lblNames.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 22
    !tooltip: tr('Ej: Amigo Uno, Amigo Dos')

  HorizontalSeparator
    id: sep1
    anchors.top: customNames.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tUh
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Vida del amigo (runa o pocion)

  BotItem
    id: uhItem
    anchors.top: tUh.bottom
    anchors.left: parent.left
    margin-top: 4

  Label
    id: lblUhHp
    anchors.verticalCenter: uhItem.verticalCenter
    anchors.left: uhItem.right
    margin-left: 8
    width: 150
    text: Usar si su HP % <=

  SpinBox
    id: uhHp
    anchors.verticalCenter: uhItem.verticalCenter
    anchors.left: lblUhHp.right
    width: 45
    minimum: 0
    maximum: 100

  VbTitle
    id: tMp
    anchors.top: uhItem.bottom
    anchors.left: parent.left
    margin-top: 8
    text: Mana del amigo (pocion)

  BotItem
    id: manaItem
    anchors.top: tMp.bottom
    anchors.left: parent.left
    margin-top: 4

  Label
    id: lblMpVal
    anchors.verticalCenter: manaItem.verticalCenter
    anchors.left: manaItem.right
    margin-left: 8
    width: 150
    text: Usar si su MP % <=

  SpinBox
    id: manaMp
    anchors.verticalCenter: manaItem.verticalCenter
    anchors.left: lblMpVal.right
    width: 45
    minimum: 0
    maximum: 100

  HorizontalSeparator
    id: sep3
    anchors.top: manaItem.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  Label
    id: lblSafe
    anchors.top: sep3.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 210
    color: #ff7777
    text: Pausar si MI HP % <= (0 = nunca)

  SpinBox
    id: mySafeHp
    anchors.verticalCenter: lblSafe.verticalCenter
    anchors.left: lblSafe.right
    width: 45
    minimum: 0
    maximum: 95

  Label
    id: lblDist
    anchors.top: lblSafe.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 210
    text: Distancia maxima (sqm)

  SpinBox
    id: maxDist
    anchors.verticalCenter: lblDist.verticalCenter
    anchors.left: lblDist.right
    width: 45
    minimum: 1
    maximum: 7

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: moreBtn
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 130
    text: Hechizos y boost

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar

EKMoreWindow < MainWindow
  !text: tr('Party Support - Hechizos y boost')
  size: 400 430
  @onEscape: self:hide()

  CheckBox
    id: sioEnabled
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text: Curar amigo con hechizo (ej: exura sio)

  Label
    id: lSioWords
    anchors.top: sioEnabled.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 70
    text: Hechizo:

  TextEdit
    id: sioWords
    anchors.verticalCenter: lSioWords.verticalCenter
    anchors.left: lSioWords.right
    anchors.right: parent.right
    height: 20

  Label
    id: lSioHp
    anchors.top: lSioWords.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 210
    text: Usar si su HP % <=

  SpinBox
    id: sioHp
    anchors.verticalCenter: lSioHp.verticalCenter
    anchors.left: lSioHp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lSioMana
    anchors.top: lSioHp.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 210
    text: Mana minima

  SpinBox
    id: sioMana
    anchors.verticalCenter: lSioMana.verticalCenter
    anchors.left: lSioMana.right
    width: 70
    minimum: 0
    maximum: 50000
    step: 10

  HorizontalSeparator
    id: sep1
    anchors.top: lSioMana.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  CheckBox
    id: boostEnabled
    anchors.top: sep1.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Boost a la guild por turnos (uno por uno)

  Label
    id: lBoostWords
    anchors.top: boostEnabled.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 70
    text: Hechizo:

  TextEdit
    id: boostWords
    anchors.verticalCenter: lBoostWords.verticalCenter
    anchors.left: lBoostWords.right
    anchors.right: parent.right
    height: 20

  Label
    id: lEvery
    anchors.top: lBoostWords.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 210
    text: Repetir a cada uno cada (seg)

  SpinBox
    id: boostEvery
    anchors.verticalCenter: lEvery.verticalCenter
    anchors.left: lEvery.right
    width: 60
    minimum: 5
    maximum: 3600
    step: 5

  Label
    id: lGap
    anchors.top: lEvery.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 210
    text: Pausa entre lanzamientos (seg)

  SpinBox
    id: boostGap
    anchors.verticalCenter: lGap.verticalCenter
    anchors.left: lGap.right
    width: 60
    minimum: 1
    maximum: 60
    step: 1

  Label
    id: lBMana
    anchors.top: lGap.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 210
    text: Mana minima

  SpinBox
    id: boostMana
    anchors.verticalCenter: lBMana.verticalCenter
    anchors.left: lBMana.right
    width: 70
    minimum: 0
    maximum: 50000
    step: 10

  Label
    id: boostInfo
    anchors.top: lBMana.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10
    height: 30
    text-wrap: true
    text-auto-resize: false
    color: #88ccff
    text: Turno: -

  VbHint
    id: hint
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: closeBtn.top
    margin-bottom: 6
    text: {name} = nombre del amigo. El boost solo sale si nadie necesita cura.

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

local ekUI = UIx.scriptPanel("Party Support")
local ekWin = UI.createWindow('EKSupportWindow', rootWidget)
ekWin:hide()

local lastEkStatus = ""
local function setEkStatus(text, color)
  if text == lastEkStatus then return end
  lastEkStatus = text
  UIx.setLabel(ekUI.status, text, color)
  UIx.setLabel(ekWin.status, text, color)
end

ekWin.helpParty:setChecked(ec.helpParty)
ekWin.helpParty.onCheckChange = function(w, c) ec.helpParty = c end
ekWin.helpGuild:setChecked(ec.helpGuild)
ekWin.helpGuild.onCheckChange = function(w, c) ec.helpGuild = c end

local mWin = UI.createWindow('EKMoreWindow', rootWidget)
mWin:hide()
mWin.boostEnabled:setChecked(ec.boostEnabled)
mWin.boostEnabled.onCheckChange = function(w, c) ec.boostEnabled = c end
mWin.boostWords:setText(ec.boostWords)
mWin.boostWords.onTextChange = function(w, t) ec.boostWords = t end
mWin.boostEvery:setValue(ec.boostEvery)
mWin.boostEvery.onValueChange = function(w, v) ec.boostEvery = v end
mWin.boostGap:setValue(ec.boostGap)
mWin.boostGap.onValueChange = function(w, v) ec.boostGap = v end
mWin.boostMana:setValue(ec.boostMana)
mWin.boostMana.onValueChange = function(w, v) ec.boostMana = v end
mWin.closeBtn.onClick = function() mWin:hide() end
ekWin.moreBtn.onClick = function() UIx.toggleWindow(mWin) end
local lastBoostInfo = ""
local function setBoostInfo(t)
  if t == lastBoostInfo then return end
  lastBoostInfo = t
  pcall(function() mWin.boostInfo:setText(t) end)
end
ekWin.customNames:setText(ec.customNames or "")
ekWin.customNames.onTextChange = function(w, text) ec.customNames = text end
ekWin.uhItem:setItemId(ec.uhId or 0)
ekWin.uhItem.onItemChange = function(w) ec.uhId = w:getItemId() end
ekWin.uhHp:setValue(ec.uhHp or 0)
ekWin.uhHp.onValueChange = function(w, v) ec.uhHp = v end
ekWin.manaItem:setItemId(ec.manaPotId or 0)
ekWin.manaItem.onItemChange = function(w) ec.manaPotId = w:getItemId() end
ekWin.manaMp:setValue(ec.manaPotMp or 0)
ekWin.manaMp.onValueChange = function(w, v) ec.manaPotMp = v end
ekWin.mySafeHp:setValue(ec.mySafeHp or 0)
ekWin.mySafeHp.onValueChange = function(w, v) ec.mySafeHp = v end
ekWin.maxDist:setValue(ec.maxDist or 5)
ekWin.maxDist.onValueChange = function(w, v) ec.maxDist = v end
mWin.sioEnabled:setChecked(ec.sioEnabled)
mWin.sioEnabled.onCheckChange = function(w, c) ec.sioEnabled = c end
mWin.sioWords:setText(ec.sioWords)
mWin.sioWords.onTextChange = function(w, t) ec.sioWords = t end
mWin.sioHp:setValue(ec.sioHp)
mWin.sioHp.onValueChange = function(w, v) ec.sioHp = v end
mWin.sioMana:setValue(ec.sioMana)
mWin.sioMana.onValueChange = function(w, v) ec.sioMana = v end
ekWin.closeBtn.onClick = function() ekWin:hide() end
ekUI.setupBtn.onClick = function() UIx.toggleWindow(ekWin) end

UIx.bindSwitch(ec, ekUI.switch, ekWin.enableBtn, function(v)
  if v then setEkStatus("Activo", "#66ff66") else setEkStatus("Inactivo", "#888888") end
end)

-- Perfil: solo Druid cura amigos con hechizo
Prof.register(function(v)
  local on = (v == "druid")
  ec.sioEnabled = on
  mWin.sioEnabled:setChecked(on)
  return "Party: hechizo para amigos " .. (on and "SI" or "NO")
end)

local lastRune, lastPot = -1000000, -1000000
local RUNE_CD, POT_CD, SELF_POT_GAP = 1000, 1000, 1100
local lastSio, SIO_CD = -1000000, 1000

local function trim(s) return (s or ""):match("^%s*(.-)%s*$") end

local function groupCooldown(id)
  local ok, res = pcall(function()
    return modules.game_cooldown.isGroupCooldownIconActive(id)
  end)
  return ok and res == true
end

local function myMana()
  local ok, m = pcall(function() return mana() end)
  return (ok and type(m) == "number") and m or 0
end

-- 'exura sio "{name}"' -> 'exura sio "Amigo"'
local function sioFor(name)
  local w = trim(ec.sioWords)
  if w:find("{name}", 1, true) then
    return (w:gsub("{name}", function() return name end))
  end
  return w .. ' "' .. name .. '"'
end

local function getPriorityList()
  local list = {}
  for name in string.gmatch(ec.customNames or "", "([^,]+)") do
    local clean = name:match("^%s*(.-)%s*$")
    if clean and clean ~= "" then list[clean:lower()] = true end
  end
  return list
end

local function isParty(spec)
  local ok, res = pcall(function() return spec:isPartyMember() end)
  if ok and res == true then return true end
  -- Escudos de party: 3..10 (azul/amarillo, con o sin exp compartida)
  local ok2, sh = pcall(function() return spec:getShield() end)
  return ok2 and type(sh) == "number" and sh >= 3 and sh <= 10
end

-- De mi guild: SOLO emblema de aliado de guild (valor 1, como el Sabuezo).
-- No usar el 4 (ese marca a jugadores sin relacion y metia a todos).
local function isGuild(spec)
  local ok, em = pcall(function() return spec:getEmblem() end)
  return ok and em == 1
end

-- ----- Boost por turnos -----
-- lastBoost[nombre] = cuando se le dio por ultima vez
local lastBoost, boostPending = {}, nil
local lastBoostCast, boostBlockUntil = -1000000, 0
local function boostFor(name)
  local w = trim(ec.boostWords)
  if w:find("{name}", 1, true) then
    return (w:gsub("{name}", function() return name end))
  end
  return w .. ' "' .. name .. '"'
end
-- Si el hechizo falla justo despues de lanzarlo, ese compañero se reintenta
onTextMessage(function(mode, text)
  if not boostPending or now - boostPending.at > 1200 then return end
  local t = (text or ""):lower()
  if t:find("exhausted", 1, true) or t:find("not possible", 1, true)
     or t:find("not enough mana", 1, true) or t:find("cannot", 1, true)
     or t:find("you need", 1, true) then
    lastBoost[boostPending.key] = boostPending.prev
    boostBlockUntil = now + 1000
    boostPending = nil
  end
end)

local function sightClear(a, b)
  local ok, res = pcall(function() return g_map.isSightClear(a, b, true) end)
  if not ok or res == nil then return true end
  return res
end

local function manaOf(spec)
  local ok, res = pcall(function() return spec:getManaPercent() end)
  if not ok or type(res) ~= "number" or res <= 0 then return nil end
  return res
end

macro(200, function()
  if not ec.enabled or not g_game.isOnline() then return end

  local myHp = hppercent()
  if not myHp then return end
  if (ec.mySafeHp or 0) > 0 and myHp <= ec.mySafeHp then
    setEkStatus("Pausa: tu HP (" .. myHp .. "%) <= " .. ec.mySafeHp .. "%", "#ffaa44")
    return
  end

  local myPos = pos()
  if not myPos then return end

  local maxDist = ec.maxDist or 5
  local prioNames = getPriorityList()
  local candidates, farName = {}, nil
  local boostList = {}   -- todos los de la guild/party/lista en pantalla

  for _, spec in ipairs(getSpectators()) do
    if spec and spec:isPlayer() and not spec:isLocalPlayer() then
      local name = spec:getName() or ""
      local isPrio = prioNames[name:lower()] == true
      local isAlly = isGuild(spec)
      if isPrio or (ec.helpParty and isParty(spec)) or (ec.helpGuild and isAlly) then
        local sPos = spec:getPosition()
        local hp = spec:getHealthPercent() or 0
        -- BOOST: solo a los de tu guild (emblema) y a los nombres que
        -- escribiste a mano. NUNCA a party sola ni a la friend list.
        if sPos and sPos.z == myPos.z and hp > 0 and (isAlly or isPrio) then
          table.insert(boostList, name)
        end
        if sPos and sPos.z == myPos.z and hp > 0 then
          local dist = math.max(math.abs(myPos.x - sPos.x), math.abs(myPos.y - sPos.y))
          if dist <= maxDist then
            table.insert(candidates, {
              creature = spec, name = name, pos = sPos, hp = hp,
              mp = manaOf(spec), prio = isPrio and 1 or 2,
            })
          else
            farName = farName or name
          end
        end
      end
    end
  end

  -- Boost por turnos (lo mas bajo en prioridad: solo si nadie necesita cura)
  local function tryBoost()
    if not ec.boostEnabled or trim(ec.boostWords) == "" or #boostList == 0 then
      return false
    end
    -- siguiente en la rueda: el que hace mas tiempo no recibe boost
    local every = (ec.boostEvery or 60) * 1000
    local pick, pickT, ready = nil, math.huge, 0
    for _, n in ipairs(boostList) do
      local tl = lastBoost[n:lower()] or -1000000000
      if now - tl >= every then
        ready = ready + 1
        if tl < pickT then pick, pickT = n, tl end
      end
    end
    if not pick then
      setBoostInfo("Todos con boost (" .. #boostList .. "). Siguiente vuelta pronto.")
      return false
    end
    setBoostInfo("Turno: " .. pick .. "  |  faltan " .. ready .. " de " .. #boostList)
    if now - lastBoostCast < (ec.boostGap or 2) * 1000 then return false end
    if now < boostBlockUntil then return false end
    if myHp < 80 then return false end
    if myMana() < (ec.boostMana or 0) then
      setEkStatus("Boost: falta mana", "#ffaa44")
      return false
    end
    -- no pisar curas ni hechizos de soporte (haste, utito, exani hur)
    if now - Shared.lastSelfHeal < 1000 or groupCooldown(2) then return false end
    if not Shared.supportReady() then return false end
    local key = pick:lower()
    boostPending = {key = key, prev = lastBoost[key], at = now}
    lastBoost[key] = now
    lastBoostCast = now
    Shared.lastSupport = now
    say(boostFor(pick))
    setEkStatus("Boost a " .. pick, "#cc88ff")
    return true
  end

  if #candidates == 0 then
    if tryBoost() then return end
    if farName then
      setEkStatus(farName .. " esta a mas de " .. maxDist .. " sqm", "#ffcc66")
    else
      setEkStatus("Nadie para ayudar (revisa party o nombres)", "#ffcc66")
    end
    return
  end

  table.sort(candidates, function(a, b)
    if a.prio ~= b.prio then return a.prio < b.prio end
    return a.hp < b.hp
  end)

  -- 1) Runa de curacion (UH)
  local uhId = ec.uhId or 0
  local noSight = nil
  if uhId > 0 and now - lastRune >= RUNE_CD then
    for _, t in ipairs(candidates) do
      if t.hp <= (ec.uhHp or 0) then
        if sightClear(myPos, t.pos) then
          local rune = findItem(uhId)
          if rune then
            useWith(rune, t.creature)
          else
            pcall(function() g_game.useInventoryItemWith(uhId, t.creature, 0) end)
          end
          lastRune = now
          Shared.lastUseId, Shared.lastUseAt = uhId, now
          setEkStatus("UH a " .. t.name .. " (" .. t.hp .. "%)" ..
            (rune and "" or " por hotkey"), "#88ff88")
          return
        end
        noSight = noSight or t.name
      end
    end
  end

  -- 1b) Hechizo de curar amigo (ej: exura sio)
  local sioNoMana = nil
  if ec.sioEnabled and trim(ec.sioWords) ~= "" then
    for _, t in ipairs(candidates) do
      if t.hp <= (ec.sioHp or 0) then
        if myMana() < (ec.sioMana or 0) then
          sioNoMana = t.name
        else
          -- Avisa al War Healer de que hay un amigo esperando
          Shared.friendWantAt, Shared.friendWantHp = now, t.hp
          if now - lastSio >= SIO_CD and now - Shared.lastSelfHeal >= 1000
             and not groupCooldown(2) then
            say(sioFor(t.name))
            lastSio = now
            Shared.lastFriendHeal = now
            setEkStatus("Curando a " .. t.name .. " (" .. t.hp .. "%)", "#88ff88")
            return
          end
        end
        break
      end
    end
  end

  -- 2) Pocion de mana al amigo
  local potId = ec.manaPotId or 0
  local manaUnknown = true
  for _, t in ipairs(candidates) do
    if t.mp then manaUnknown = false break end
  end
  if potId > 0 and now - lastPot >= POT_CD
     and now - Shared.lastSelfPotion >= SELF_POT_GAP
     and not EquipCore.holdPotion(100) then
    for _, t in ipairs(candidates) do
      if t.mp and t.mp <= (ec.manaPotMp or 0) then
        local pot = findItem(potId)
        if pot then
          useWith(pot, t.creature)
        else
          pcall(function() g_game.useInventoryItemWith(potId, t.creature, 0) end)
        end
        lastPot = now
        Shared.lastSelfPotion = now
        Shared.lastUseId, Shared.lastUseAt = potId, now
        setEkStatus("Mana a " .. t.name .. " (" .. t.mp .. "%)", "#88ccff")
        return
      end
    end
  end

  -- 3) Boost por turnos (si nadie necesita nada)
  if not noSight and tryBoost() then return end

  -- 4) Nada que hacer: mostrar a quien vigila
  if noSight then
    setEkStatus("Sin linea de vision a " .. noSight, "#ffaa44")
    return
  end
  if sioNoMana then
    setEkStatus("Sin mana para curar a " .. sioNoMana, "#ffaa44")
    return
  end
  local low = candidates[1]
  for _, t in ipairs(candidates) do
    if t.hp < low.hp then low = t end
  end
  local txt = "Vigilando " .. #candidates .. ": " .. low.name .. " " .. low.hp .. "%"
  if potId > 0 and manaUnknown then txt = txt .. " | mana no visible" end
  setEkStatus(txt, "#66ff66")
end)

end -- fin: 6. HP - Party Support
endSection(__sec)

-- #####################################################################
-- 7. TOOLS - Safe Anti-Push (Drag Items: Coin / Food)
-- #####################################################################
__sec = startSection("Tools")
do
setDefaultTab("Tools")

local APK = "safeAntiPushDragV1"

local GOLD_ID     = 3031
local FOOD_ID     = 3577
local PLATINUM_ID = 3035
local CRYSTAL_ID  = 3043

if type(storage[APK]) ~= "table" then
  storage[APK] = {
    enabled = false,
    useCoins = true,
    coinId = GOLD_ID,
    useFood = true,
    foodId = FOOD_ID,
    minItems = 2,
    delay = 600,
    autoChange = true,
    autoFood = true,
    foodSpell = "!food",
    autoBank = false,
    bankCommand = "!withdraw 2000"
  }
end
local ap = storage[APK]
if ap.onlyPlayers == nil then ap.onlyPlayers = false end

g_ui.loadUIFromString([[
SafeAntiPushDragWindow < MainWindow
  !text: tr('Anti-Push Seguro')
  size: 400 580
  @onEscape: self:hide()

  VbTitle
    id: tCoin
    anchors.top: parent.top
    anchors.left: parent.left
    text: Monedas

  BotItem
    id: coinItem
    anchors.top: tCoin.bottom
    anchors.left: parent.left
    margin-top: 4
    !tooltip: tr('Moneda a tirar (arrastra aqui)')

  CheckBox
    id: useCoins
    anchors.verticalCenter: coinItem.verticalCenter
    anchors.left: coinItem.right
    anchors.right: parent.right
    margin-left: 8
    text: Tirar monedas

  CheckBox
    id: autoChange
    anchors.top: coinItem.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Cambiar platinum/crystal si no hay gold

  HorizontalSeparator
    id: sep1
    anchors.top: autoChange.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tFood
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Comida

  BotItem
    id: foodItem
    anchors.top: tFood.bottom
    anchors.left: parent.left
    margin-top: 4
    !tooltip: tr('Comida a tirar (arrastra aqui)')

  CheckBox
    id: useFood
    anchors.verticalCenter: foodItem.verticalCenter
    anchors.left: foodItem.right
    anchors.right: parent.right
    margin-left: 8
    text: Tirar comida

  CheckBox
    id: autoFood
    anchors.top: foodItem.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Crear comida con hechizo si se acaba

  Label
    id: lblSpell
    anchors.top: autoFood.bottom
    anchors.left: parent.left
    margin-top: 8
    width: 70
    text: Hechizo:

  TextEdit
    id: foodSpell
    anchors.verticalCenter: lblSpell.verticalCenter
    anchors.left: lblSpell.right
    anchors.right: parent.right
    height: 20

  HorizontalSeparator
    id: sep2
    anchors.top: lblSpell.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  VbTitle
    id: tBank
    anchors.top: sep2.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Banco

  CheckBox
    id: autoBank
    anchors.top: tBank.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Retirar dinero si no quedan monedas (max 1/min)

  Label
    id: lblBank
    anchors.top: autoBank.bottom
    anchors.left: parent.left
    margin-top: 8
    width: 70
    text: Comando:

  TextEdit
    id: bankCommand
    anchors.verticalCenter: lblBank.verticalCenter
    anchors.left: lblBank.right
    anchors.right: parent.right
    height: 20

  HorizontalSeparator
    id: sep3
    anchors.top: lblBank.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  VbTitle
    id: tOpts
    anchors.top: sep3.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Opciones

  Label
    id: lblMin
    anchors.top: tOpts.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 200
    text: Tipos de item minimos en el piso

  SpinBox
    id: minItems
    anchors.verticalCenter: lblMin.verticalCenter
    anchors.left: lblMin.right
    width: 45
    minimum: 1
    maximum: 5

  Label
    id: lblDelay
    anchors.top: lblMin.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: Pausa entre tiros (ms)

  SpinBox
    id: delay
    anchors.verticalCenter: lblDelay.verticalCenter
    anchors.left: lblDelay.right
    width: 55
    minimum: 200
    maximum: 2000
    step: 50

  CheckBox
    id: onlyPlayers
    anchors.top: lblDelay.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: Solo si hay otros jugadores en pantalla

  VbHint
    id: apHint
    anchors.top: onlyPlayers.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Solo tira estando quieto. Cuenta tipos distintos en el piso (moneda, comida, platinum) para que no se apilen.

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

local apUI = UIx.scriptPanel("Safe Anti-Push")
local apWin = UI.createWindow('SafeAntiPushDragWindow', rootWidget)
apWin:hide()

local lastApStatus = ""
local function setApStatus(text, color)
  if text == lastApStatus then return end
  lastApStatus = text
  UIx.setLabel(apUI.status, text, color)
  UIx.setLabel(apWin.status, text, color)
end

apWin.coinItem:setItemId(ap.coinId or GOLD_ID)
apWin.coinItem.onItemChange = function(w) ap.coinId = w:getItemId() end
apWin.foodItem:setItemId(ap.foodId or FOOD_ID)
apWin.foodItem.onItemChange = function(w) ap.foodId = w:getItemId() end

apWin.useCoins:setChecked(ap.useCoins)
apWin.useCoins.onCheckChange = function(w, c) ap.useCoins = c end
apWin.autoChange:setChecked(ap.autoChange)
apWin.autoChange.onCheckChange = function(w, c) ap.autoChange = c end
apWin.useFood:setChecked(ap.useFood)
apWin.useFood.onCheckChange = function(w, c) ap.useFood = c end
apWin.autoFood:setChecked(ap.autoFood)
apWin.autoFood.onCheckChange = function(w, c) ap.autoFood = c end
apWin.foodSpell:setText(ap.foodSpell or "")
apWin.foodSpell.onTextChange = function(w, text) ap.foodSpell = text end
apWin.autoBank:setChecked(ap.autoBank)
apWin.autoBank.onCheckChange = function(w, c) ap.autoBank = c end
apWin.bankCommand:setText(ap.bankCommand or "")
apWin.bankCommand.onTextChange = function(w, text) ap.bankCommand = text end
apWin.minItems:setValue(ap.minItems or 2)
apWin.minItems.onValueChange = function(w, v) ap.minItems = v end
apWin.delay:setValue(ap.delay or 600)
apWin.delay.onValueChange = function(w, v) ap.delay = v end
apWin.onlyPlayers:setChecked(ap.onlyPlayers)
apWin.onlyPlayers.onCheckChange = function(w, c) ap.onlyPlayers = c end
apWin.closeBtn.onClick = function() apWin:hide() end
apUI.setupBtn.onClick = function() UIx.toggleWindow(apWin) end

UIx.bindSwitch(ap, apUI.switch, apWin.enableBtn, function(v)
  if v then setApStatus("Activo", "#66ff66") else setApStatus("Inactivo", "#888888") end
end)

local lastDrop, lastCommand, lastChange, lastBank = 0, 0, 0, -1000000
local lastPos, stillSince = nil, 0
local STILL_MS, BANK_CD = 600, 60000

local function samePos(a, b)
  return a and b and a.x == b.x and a.y == b.y and a.z == b.z
end

local function otherPlayers()
  for _, spec in ipairs(getSpectators()) do
    if spec:isPlayer() and not spec:isLocalPlayer() then return true end
  end
  return false
end

-- IDs que el script puede tirar, por prioridad
local function dropList()
  local list = {}
  if ap.useCoins and (ap.coinId or 0) > 0 then table.insert(list, ap.coinId) end
  if ap.useFood and (ap.foodId or 0) > 0 then table.insert(list, ap.foodId) end
  if ap.useCoins and ap.coinId ~= PLATINUM_ID then table.insert(list, PLATINUM_ID) end
  return list
end

macro(100, function()
  if not ap.enabled or not g_game.isOnline() then return end

  local p = pos()
  if not p then return end
  if not samePos(p, lastPos) then
    lastPos = {x = p.x, y = p.y, z = p.z}
    stillSince = now
  end
  if player:isWalking() or now - stillSince < STILL_MS then
    setApStatus("Esperando a estar quieto", "#aaaaaa")
    return
  end
  if ap.onlyPlayers and not otherPlayers() then
    setApStatus("Activo - sin jugadores cerca", "#66ff66")
    return
  end
  if now - lastDrop < (ap.delay or 600) then return end

  local myTile = g_map.getTile(p)
  if not myTile then return end

  local list = dropList()
  if #list == 0 then
    setApStatus("Nada que tirar (revisa Config)", "#ffaa44")
    return
  end

  -- Tipos distintos ya en el piso
  local onTile, have = {}, 0
  for _, item in ipairs(myTile:getItems() or {}) do
    onTile[item:getId()] = true
  end
  for _, id in ipairs(list) do
    if onTile[id] then have = have + 1 end
  end
  local need = math.min(ap.minItems or 2, #list)
  if have >= need then
    setApStatus("Protegido (" .. have .. " tipos en el piso)", "#66ff66")
    return
  end

  -- 1) Tirar 1 unidad de un tipo que aun no este en el piso
  for _, id in ipairs(list) do
    if not onTile[id] then
      local item = findItem(id)
      if item then
        g_game.move(item, p, 1)
        lastDrop = now
        setApStatus("Tirando item " .. id, "#88ff88")
        return
      end
    end
  end

  -- 2) Sin gold: cambiar platinum (y si no, crystal).
  --    Solo pilas de menos de 100: una pila de 100 sube a la moneda mayor.
  if ap.useCoins and ap.autoChange and ap.coinId == GOLD_ID
     and not findItem(GOLD_ID) and now - lastChange >= 1000 then
    local plat = findItem(PLATINUM_ID)
    if plat and plat:getCount() < 100 then
      use(plat)
      lastChange = now
      setApStatus("Cambiando platinum", "#88ccff")
      return
    end
    local cryst = findItem(CRYSTAL_ID)
    if cryst and cryst:getCount() < 100 then
      use(cryst)
      lastChange = now
      setApStatus("Cambiando crystal", "#88ccff")
      return
    end
  end

  -- 3) Crear comida o retirar dinero
  if now - lastCommand >= 4000 then
    local spell = ap.foodSpell or ""
    if ap.useFood and ap.autoFood and spell ~= "" and not findItem(ap.foodId)
       and (spell:sub(1, 1) == "!" or mana() >= 120) then
      say(spell)
      lastCommand = now
      setApStatus("Creando comida", "#88ccff")
      return
    end

    if ap.useCoins and ap.autoBank and (ap.bankCommand or "") ~= ""
       and not findItem(ap.coinId) and now - lastBank >= BANK_CD then
      say(ap.bankCommand)
      lastCommand, lastBank = now, now
      setApStatus("Retirando dinero", "#88ccff")
      return
    end
  end

  setApStatus("Sin items para tirar", "#ff6666")
end)

end -- fin: 7. TOOLS - Safe Anti-Push
endSection(__sec)

-- #####################################################################
-- 8. CAVE - Attack Bot (todas las profesiones)
--  - Hasta 6 ataques revisados en orden (arriba = mas prioridad).
--  - 4 tipos por fila (clic en el boton para cambiar):
--      Hechizo   : al objetivo (exori ico, exori vis, exori san...)
--      Area      : alrededor tuyo (exori gran, exevo mas san...)
--      Runa      : al objetivo (sudden death...)
--      Runa area : alrededor del objetivo (GFB, avalanche...)
--  - Mobs  = minimo de monstruos (area: en el rango; resto: cerca tuyo)
--  - Rango = radio del area, o distancia maxima al objetivo.
--  - "Aplicar perfil" (Main) o "Cargar preset" ponen los ataques de
--    tu profesion. Monk no tiene preset: escribe tus hechizos.
--  - Nunca en PZ. Por defecto no usa area si hay otros jugadores
--    (fuera de tu party) en pantalla, para no sacar skull.
-- #####################################################################
__sec = startSection("Cave")
do
setDefaultTab("Cave")
UIx.header("ATAQUE")

local AK        = "attackBotV1"
local MAX_RULES = 6
local KINDS     = {"spell", "area", "rune", "arune"}
local KIND_TEXT = {spell = "Hechizo", area = "Area", rune = "Runa", arune = "Runa area"}

local function emptyRule()
  return {on = false, kind = "spell", words = "", item = 0, mobs = 1, range = 1, cd = 2, mana = 0}
end

if type(storage[AK]) ~= "table" then
  storage[AK] = {enabled = false, rules = {}}
end
local ac = storage[AK]
ac.rules = ac.rules or {}
for i = 1, MAX_RULES do
  local r = ac.rules[i] or emptyRule()
  for k, v in pairs(emptyRule()) do if r[k] == nil then r[k] = v end end
  if not KIND_TEXT[r.kind] then r.kind = "spell" end
  ac.rules[i] = r
end
if ac.needTarget == nil then ac.needTarget = true end
if ac.vsPlayers == nil then ac.vsPlayers = true end
if ac.noAreaPlayers == nil then ac.noAreaPlayers = true end
ac.gapMs  = ac.gapMs or 2000
ac.pauseHp = ac.pauseHp or 0

-- Presets: {tipo, palabras o ID de runa, mobs, rango, cd (s)}
-- Los cooldowns son los de Tibia global; ajustalos a tu servidor.
local SD, GFB, AVALANCHE = 3155, 3191, 3161
local ATTACK_PRESETS = {
  knight = {
    {"area",  "exori gran",     3, 1, 6},
    {"area",  "exori mas",      4, 2, 8},
    {"area",  "exori",          2, 1, 4},
    {"spell", "exori gran ico", 1, 1, 30},
    {"spell", "exori ico",      1, 1, 6},
    {"spell", "exori hur",      1, 5, 6},
  },
  paladin = {
    {"area",  "exevo mas san",  3, 3, 4},
    {"spell", "exori gran con", 1, 7, 8},
    {"spell", "exori san",      1, 7, 2},
    {"spell", "exori con",      1, 7, 2},
  },
  sorcerer = {
    {"area",  "exevo gran mas vis", 4, 3, 40},
    {"arune", GFB,                  3, 2, 2},
    {"spell", "exori gran vis",     1, 3, 30},
    {"spell", "exori vis",          1, 3, 2},
    {"rune",  SD,                   1, 7, 2},
  },
  druid = {
    {"area",  "exevo gran mas frigo", 4, 3, 40},
    {"arune", AVALANCHE,              3, 2, 2},
    {"spell", "exori gran frigo",     1, 3, 30},
    {"spell", "exori frigo",          1, 3, 2},
    {"rune",  SD,                     1, 7, 2},
  },
}

g_ui.loadUIFromString([[
AttackRuleRow < Panel
  height: 38

  CheckBox
    id: on
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 16
    !tooltip: tr('Activar esta fila')

  Button
    id: kind
    anchors.left: on.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 4
    width: 70
    height: 20
    !tooltip: tr('Clic para cambiar: Hechizo / Area / Runa / Runa area')

  TextEdit
    id: words
    anchors.left: kind.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 4
    width: 110
    height: 20
    !tooltip: tr('Palabras del hechizo')

  BotItem
    id: item
    anchors.left: kind.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 4
    !tooltip: tr('Arrastra la runa aqui')

  Label
    id: lMobs
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 210
    width: 32
    text: Mobs

  SpinBox
    id: mobs
    anchors.left: lMobs.right
    anchors.verticalCenter: parent.verticalCenter
    width: 38
    minimum: 1
    maximum: 15

  Label
    id: lRange
    anchors.left: mobs.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    width: 36
    text: Rango

  SpinBox
    id: range
    anchors.left: lRange.right
    anchors.verticalCenter: parent.verticalCenter
    width: 38
    minimum: 1
    maximum: 10

  Label
    id: lCd
    anchors.left: range.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    width: 22
    text: CD

  SpinBox
    id: cd
    anchors.left: lCd.right
    anchors.verticalCenter: parent.verticalCenter
    width: 44
    minimum: 0
    maximum: 600
    !tooltip: tr('Cooldown en segundos')

  Label
    id: lMp
    anchors.left: cd.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    width: 24
    text: MP

  SpinBox
    id: mana
    anchors.left: lMp.right
    anchors.verticalCenter: parent.verticalCenter
    width: 56
    minimum: 0
    maximum: 50000
    step: 10
    !tooltip: tr('Mana minima (0 = no revisar)')

AttackBotWindow < MainWindow
  !text: tr('Attack Bot')
  size: 580 620
  @onEscape: self:hide()

  VbTitle
    id: tRules
    anchors.top: parent.top
    anchors.left: parent.left
    text: Ataques (en orden de prioridad)

  VbHint
    id: hRules
    anchors.top: tRules.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 2
    text: Area = alrededor tuyo. Runa area = alrededor del objetivo. Hechizo / Runa = al objetivo. Rango = radio del area o distancia maxima al objetivo. Mobs = minimo de monstruos. Pon las areas arriba.

  Panel
    id: rules
    anchors.top: hRules.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 240
    layout:
      type: verticalBox
      spacing: 2

  HorizontalSeparator
    id: sep1
    anchors.top: rules.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6

  VbTitle
    id: tOpts
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Opciones

  CheckBox
    id: needTarget
    anchors.top: tOpts.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Solo si estoy atacando a algo (con target)

  CheckBox
    id: vsPlayers
    anchors.top: needTarget.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Usar Hechizo / Runa contra jugadores (war)

  CheckBox
    id: noAreaPlayers
    anchors.top: vsPlayers.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: No usar area si hay otros jugadores en pantalla (fuera de party)

  Label
    id: lGap
    anchors.top: noAreaPlayers.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 220
    text: Pausa entre ataques (ms)

  SpinBox
    id: gapMs
    anchors.verticalCenter: lGap.verticalCenter
    anchors.left: lGap.right
    width: 60
    minimum: 200
    maximum: 5000
    step: 100

  Label
    id: lPause
    anchors.top: lGap.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 220
    text: No atacar si mi HP % <= (0 = no)

  SpinBox
    id: pauseHp
    anchors.verticalCenter: lPause.verticalCenter
    anchors.left: lPause.right
    width: 60
    minimum: 0
    maximum: 100

  VbHint
    id: hOpts
    anchors.top: lPause.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: En Tibia global los ataques comparten 2 s de cooldown. Si tu servidor es mas rapido, baja la pausa. Si usas los ataques del TargetBot, apagalos alli para no repetir.

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: presetBtn
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 170
    text: Cargar preset de mi profesion

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

local aUI = UIx.scriptPanel("Attack Bot")
local aWin = UI.createWindow('AttackBotWindow', rootWidget)
aWin:hide()

local lastAStatus = ""
local function setAStatus(text, color)
  if text == lastAStatus then return end
  lastAStatus = text
  UIx.setLabel(aUI.status, text, color)
  UIx.setLabel(aWin.status, text, color)
end

local function trim(s) return (s or ""):match("^%s*(.-)%s*$") end
local function isRuneKind(k) return k == "rune" or k == "arune" end

-- Filas de la ventana
local rows = {}
local function showRow(i)
  local r, row = ac.rules[i], rows[i]
  row.kind:setText(KIND_TEXT[r.kind])
  row.words:setVisible(not isRuneKind(r.kind))
  row.item:setVisible(isRuneKind(r.kind))
  row.on:setChecked(r.on)
  row.words:setText(r.words or "")
  row.item:setItemId(r.item or 0)
  row.mobs:setValue(r.mobs)
  row.range:setValue(r.range)
  row.cd:setValue(r.cd)
  row.mana:setValue(r.mana)
end

for i = 1, MAX_RULES do
  local r = ac.rules[i]
  local row = UI.createWidget('AttackRuleRow', aWin.rules)
  rows[i] = row
  showRow(i)
  row.on.onCheckChange    = function(w, c) ac.rules[i].on = c end
  row.words.onTextChange  = function(w, t) ac.rules[i].words = t end
  row.item.onItemChange   = function(w) ac.rules[i].item = w:getItemId() end
  row.mobs.onValueChange  = function(w, v) ac.rules[i].mobs = v end
  row.range.onValueChange = function(w, v) ac.rules[i].range = v end
  row.cd.onValueChange    = function(w, v) ac.rules[i].cd = v end
  row.mana.onValueChange  = function(w, v) ac.rules[i].mana = v end
  row.kind.onClick = function()
    local cur, idx = ac.rules[i].kind, 1
    for k, name in ipairs(KINDS) do if name == cur then idx = k end end
    ac.rules[i].kind = KINDS[idx % #KINDS + 1]
    showRow(i)
  end
end

local function loadPreset(v)
  local p = ATTACK_PRESETS[v]
  if not p then return false end
  for i = 1, MAX_RULES do
    local d, r = p[i], emptyRule()
    if d then
      r.on, r.kind, r.mobs, r.range, r.cd = true, d[1], d[3], d[4], d[5]
      if isRuneKind(d[1]) then r.item = d[2] else r.words = d[2] end
    end
    ac.rules[i] = r
    showRow(i)
  end
  return true
end

Prof.register(function(v)
  if loadPreset(v) then return "Ataque: preset de " .. Prof.name(v) end
  return "Ataque: sin preset para " .. Prof.name(v) .. ", escribe tus ataques"
end)

aWin.needTarget:setChecked(ac.needTarget)
aWin.needTarget.onCheckChange = function(w, c) ac.needTarget = c end
aWin.vsPlayers:setChecked(ac.vsPlayers)
aWin.vsPlayers.onCheckChange = function(w, c) ac.vsPlayers = c end
aWin.noAreaPlayers:setChecked(ac.noAreaPlayers)
aWin.noAreaPlayers.onCheckChange = function(w, c) ac.noAreaPlayers = c end
aWin.gapMs:setValue(ac.gapMs)
aWin.gapMs.onValueChange = function(w, v) ac.gapMs = v end
aWin.pauseHp:setValue(ac.pauseHp)
aWin.pauseHp.onValueChange = function(w, v) ac.pauseHp = v end
aWin.presetBtn.onClick = function()
  local v = Prof.get()
  if loadPreset(v) then
    setAStatus("Preset de " .. Prof.name(v) .. " cargado", "#88ccff")
  else
    setAStatus(Prof.name(v) .. " no tiene preset: escribe tus ataques", "#ffaa44")
  end
end
aWin.closeBtn.onClick = function() aWin:hide() end
aUI.setupBtn.onClick = function() UIx.toggleWindow(aWin) end

local lastUse, lastAttack = {}, -1000000

UIx.bindSwitch(ac, aUI.switch, aWin.enableBtn, function(v)
  lastUse = {}
  if v then setAStatus("Activo", "#66ff66") else setAStatus("Inactivo", "#888888") end
end)

-- Ayudas
local function dist(a, b)
  if not a or not b or a.z ~= b.z then return 99 end
  return math.max(math.abs(a.x - b.x), math.abs(a.y - b.y))
end

local function groupCooldown(id)
  local ok, res = pcall(function()
    return modules.game_cooldown.isGroupCooldownIconActive(id)
  end)
  return ok and res == true
end

local function inPz()
  local ok, res = pcall(function()
    if isInPz then return isInPz() end
    return player:hasState((PlayerStates and PlayerStates.Pz) or 16384)
  end)
  return ok and res == true
end

local function myMana()
  local ok, m = pcall(function() return mana() end)
  return (ok and type(m) == "number") and m or 0
end

local function sightClear(a, b)
  local ok, res = pcall(function() return g_map.isSightClear(a, b, true) end)
  if not ok or res == nil then return true end
  return res
end

local function isPartyMember(spec)
  local ok, res = pcall(function() return spec:isPartyMember() end)
  if ok and res == true then return true end
  local ok2, sh = pcall(function() return spec:getShield() end)
  return ok2 and type(sh) == "number" and sh >= 3 and sh <= 10
end

local function countAround(list, center, radius)
  local n = 0
  for _, m in ipairs(list) do
    if dist(center, m) <= radius then n = n + 1 end
  end
  return n
end

local function ruleName(r)
  if isRuneKind(r.kind) then return "runa " .. (r.item or 0) end
  return trim(r.words)
end

macro(100, function()
  if not ac.enabled or not g_game.isOnline() then return end
  if now - lastAttack < (ac.gapMs or 2000) then return end
  if groupCooldown(1) then return end

  local hp = hppercent()
  if (ac.pauseHp or 0) > 0 and hp and hp <= ac.pauseHp then
    setAStatus("Pausa: tu HP bajo", "#ffaa44")
    return
  end
  if inPz() then
    setAStatus("En PZ", "#aaaaaa")
    return
  end

  local me = pos()
  if not me then return end

  local target = g_game.getAttackingCreature()
  local tPos = target and target:getPosition() or nil
  if target and (not tPos or tPos.z ~= me.z) then target, tPos = nil, nil end
  local targetIsPlayer = target and target:isPlayer() or false

  if ac.needTarget and not target then
    setAStatus("Esperando objetivo", "#aaaaaa")
    return
  end
  if targetIsPlayer and not ac.vsPlayers then
    setAStatus("Objetivo es jugador (desactivado)", "#aaaaaa")
    return
  end

  -- Monstruos y jugadores en pantalla
  local mobs, otherPlayers = {}, false
  for _, spec in ipairs(getSpectators()) do
    local sp = spec:getPosition()
    if sp and sp.z == me.z then
      if spec:isMonster() then
        if (spec:getHealthPercent() or 0) > 0 and not Shared.isIgnoredMob(spec) then
          table.insert(mobs, sp)
        end
      elseif spec:isPlayer() and not spec:isLocalPlayer() and not isPartyMember(spec) then
        otherPlayers = true
      end
    end
  end
  local nearMe = countAround(mobs, me, 7)
  local myMp = myMana()
  local tDist = dist(me, tPos)
  local waitReason = nil

  for i, r in ipairs(ac.rules) do
    local name = ruleName(r)
    local usable = r.on and ((isRuneKind(r.kind) and (r.item or 0) > 0)
                   or (not isRuneKind(r.kind) and name ~= ""))
    if usable and now - (lastUse[i] or -1000000) >= (r.cd or 0) * 1000 then
      local ok, count = false, 0

      if r.kind == "area" then
        count = countAround(mobs, me, r.range)
        ok = count >= r.mobs and not (ac.noAreaPlayers and otherPlayers)
             and not targetIsPlayer
      elseif r.kind == "arune" then
        if target and not targetIsPlayer and tDist <= 7 then
          count = countAround(mobs, tPos, r.range)
          ok = count >= r.mobs and not (ac.noAreaPlayers and otherPlayers)
               and sightClear(me, tPos)
        end
      else -- spell / rune al objetivo
        if target and tDist <= r.range then
          count = targetIsPlayer and 1 or nearMe
          ok = count >= r.mobs
          if ok and r.kind == "rune" then ok = sightClear(me, tPos) end
        end
      end

      if ok and (r.mana or 0) > 0 and myMp < r.mana then
        ok = false
        waitReason = waitReason or ("sin mana para " .. name)
      end
      -- Las runas no se usan justo despues de una pocion (exhausted)
      if ok and isRuneKind(r.kind) and now - Shared.lastSelfPotion < 1000 then
        ok = false
        waitReason = waitReason or "esperando pocion"
      end

      if ok then
        if isRuneKind(r.kind) then
          local rune = findItem(r.item)
          if rune then
            useWith(rune, target)
          else
            pcall(function() g_game.useInventoryItemWith(r.item, target, 0) end)
          end
          Shared.lastUseId, Shared.lastUseAt = r.item, now
        else
          say(name)
        end
        lastUse[i], lastAttack = now, now
        setAStatus(i .. ". " .. name .. (count > 1 and (" (" .. count .. " mobs)") or ""), "#88ff88")
        return
      end
    end
  end

  if waitReason then
    setAStatus("Esperando: " .. waitReason, "#ffcc66")
  elseif #mobs == 0 and not targetIsPlayer then
    setAStatus("Activo - sin monstruos", "#66ff66")
  else
    setAStatus("Activo - esperando cooldown", "#66ff66")
  end
end)

end -- fin: 8. CAVE - Attack Bot
endSection(__sec)

-- #####################################################################
-- 9. MAIN - PAZZUR: Auto Cast + Unban, Auto Bank, Auto Stamina
-- #####################################################################
__sec = startSection("Main")
do
setDefaultTab("Main")
UIx.header("PAZZUR - CAST, BANCO Y STAMINA")
local function trim(s) return (tostring(s or "")):match("^%s*(.-)%s*$") end

-- ============================================================
-- AUTO CAST ON + AUTO UNBAN
--  - Envia "/cast on" cada X segundos (y al entrar al juego).
--  - Si un espectador es baneado, lo desbanea tras X segundos.
-- ============================================================
do
  local CK = "pzAutoCastV1"
  if type(storage[CK]) ~= "table" then
    storage[CK] = {
      enabled = false, autoCast = true, command = "/cast on", interval = 220,
      unban = true, unbanDelay = 15, onlyAnon = true,
    }
  end
  local cc = storage[CK]
  if cc.autoCast == nil then cc.autoCast = true end
  if cc.unban == nil then cc.unban = true end
  if cc.onlyAnon == nil then cc.onlyAnon = true end
  cc.command = cc.command or "/cast on"
  cc.interval = cc.interval or 220
  cc.unbanDelay = cc.unbanDelay or 15

  g_ui.loadUIFromString([[
PzAutoCastWindow < MainWindow
  !text: tr('Auto Cast + Auto Unban')
  size: 400 400
  @onEscape: self:hide()

  VbTitle
    id: tCast
    anchors.top: parent.top
    anchors.left: parent.left
    text: Auto Cast

  CheckBox
    id: autoCast
    anchors.top: tCast.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Enviar el comando de cast automaticamente

  Label
    id: lblCmd
    anchors.top: autoCast.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 70
    text: Comando:

  TextEdit
    id: command
    anchors.verticalCenter: lblCmd.verticalCenter
    anchors.left: lblCmd.right
    anchors.right: parent.right
    height: 20

  Label
    id: lblInt
    anchors.top: lblCmd.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: Repetir cada (segundos)

  SpinBox
    id: interval
    anchors.verticalCenter: lblInt.verticalCenter
    anchors.left: lblInt.right
    width: 60
    minimum: 10
    maximum: 3600
    step: 10

  HorizontalSeparator
    id: sep1
    anchors.top: lblInt.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  VbTitle
    id: tUnban
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Auto Unban de espectadores

  CheckBox
    id: unban
    anchors.top: tUnban.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Desbanear espectadores baneados

  Label
    id: lblDelay
    anchors.top: unban.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 200
    text: Esperar antes de desbanear (s)

  SpinBox
    id: unbanDelay
    anchors.verticalCenter: lblDelay.verticalCenter
    anchors.left: lblDelay.right
    width: 60
    minimum: 0
    maximum: 600

  CheckBox
    id: onlyAnon
    anchors.top: lblDelay.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: Solo anonimos ("Spectator [N]")

  VbHint
    id: hint
    anchors.top: onlyAnon.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Detecta el mensaje "Spectator ... has been banned" y envia "/cast unban NOMBRE". Con "Solo anonimos" no desbanea a los que tienen nombre.

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local cUI = UIx.scriptPanel("Auto Cast + Unban")
  local cWin = UI.createWindow('PzAutoCastWindow', rootWidget)
  cWin:hide()

  local lastStatus, lastActAt = "", -100000000
  local function setStatus(t, c)
    if t == lastStatus then return end
    lastStatus = t
    UIx.setLabel(cUI.status, t, c)
    UIx.setLabel(cWin.status, t, c)
  end
  local function act(t, c) lastActAt = now; setStatus(t, c) end

  cWin.autoCast:setChecked(cc.autoCast)
  cWin.autoCast.onCheckChange = function(w, c) cc.autoCast = c end
  cWin.command:setText(cc.command)
  cWin.command.onTextChange = function(w, t) cc.command = t end
  cWin.interval:setValue(cc.interval)
  cWin.interval.onValueChange = function(w, v) cc.interval = v end
  cWin.unban:setChecked(cc.unban)
  cWin.unban.onCheckChange = function(w, c) cc.unban = c end
  cWin.unbanDelay:setValue(cc.unbanDelay)
  cWin.unbanDelay.onValueChange = function(w, v) cc.unbanDelay = v end
  cWin.onlyAnon:setChecked(cc.onlyAnon)
  cWin.onlyAnon.onCheckChange = function(w, c) cc.onlyAnon = c end
  cWin.closeBtn.onClick = function() cWin:hide() end
  cUI.setupBtn.onClick = function() UIx.toggleWindow(cWin) end

  local lastCast = 0
  UIx.bindSwitch(cc, cUI.switch, cWin.enableBtn, function(v)
    if v then lastCast = 0; setStatus("Activo", "#66ff66")
    else setStatus("Inactivo", "#888888") end
  end)

  macro(1000, function()
    if not g_game.isOnline() then lastCast = 0; return end
    if not cc.enabled then return end

    if not cc.autoCast then
      if now - lastActAt > 3000 then
        setStatus(cc.unban and "Activo - solo unban" or "Activo - nada marcado", "#66ff66")
      end
      return
    end

    local cmd = trim(cc.command or "")
    if cmd == "" then
      setStatus("Sin comando (revisa Config)", "#ffaa44")
      return
    end

    local left = (cc.interval or 220) * 1000 - (now - lastCast)
    if lastCast == 0 or left <= 0 then
      say(cmd)
      lastCast = now
      act("Cast enviado", "#88ff88")
      return
    end
    if now - lastActAt > 3000 then
      setStatus("Activo - cast en " .. math.ceil(left / 1000) .. " s", "#66ff66")
    end
  end)

  onTextMessage(function(mode, text)
    if not cc.enabled or not cc.unban or type(text) ~= "string" then return end
    -- Ej: "Spectator Spectator [2] has been banned."
    local name = text:match("Spectator%s+(.-)%s+has been banned")
    if not name or name == "" then return end
    if cc.onlyAnon and not name:match("^Spectator%s*%[%d+%]$") then return end
    local delay = (cc.unbanDelay or 15) * 1000
    act("Unban de " .. name .. " en " .. (cc.unbanDelay or 15) .. " s", "#88ccff")
    schedule(delay, function()
      if cc.enabled and cc.unban and g_game.isOnline() then
        say("/cast unban " .. name)
        act("Desbaneado: " .. name, "#88ff88")
      end
    end)
  end)
end

-- ============================================================
-- AUTO BANK
--  - Deposita al activar / al entrar al juego y luego cada X min.
-- ============================================================
do
  local BK = "pzAutoBankV1"
  if type(storage[BK]) ~= "table" then
    storage[BK] = {enabled = false, command = "!bank deposit all", interval = 30, onLogin = true}
  end
  local bc = storage[BK]
  bc.command = bc.command or "!bank deposit all"
  bc.interval = bc.interval or 30
  if bc.onLogin == nil then bc.onLogin = true end

  g_ui.loadUIFromString([[
PzAutoBankWindow < MainWindow
  !text: tr('Auto Bank')
  size: 400 290
  @onEscape: self:hide()

  VbTitle
    id: tBank
    anchors.top: parent.top
    anchors.left: parent.left
    text: Deposito automatico

  Label
    id: lblCmd
    anchors.top: tBank.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 70
    text: Comando:

  TextEdit
    id: command
    anchors.verticalCenter: lblCmd.verticalCenter
    anchors.left: lblCmd.right
    anchors.right: parent.right
    height: 20

  Label
    id: lblInt
    anchors.top: lblCmd.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: Repetir cada (minutos)

  SpinBox
    id: interval
    anchors.verticalCenter: lblInt.verticalCenter
    anchors.left: lblInt.right
    width: 55
    minimum: 1
    maximum: 600

  CheckBox
    id: onLogin
    anchors.top: lblInt.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: Depositar al activar y al entrar al juego

  Button
    id: nowBtn
    anchors.top: onLogin.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10
    height: 20
    text: Depositar ahora

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local bUI = UIx.scriptPanel("Auto Bank")
  local bWin = UI.createWindow('PzAutoBankWindow', rootWidget)
  bWin:hide()

  local lastStatus = ""
  local function setStatus(t, c)
    if t == lastStatus then return end
    lastStatus = t
    UIx.setLabel(bUI.status, t, c)
    UIx.setLabel(bWin.status, t, c)
  end

  local NEVER = -100000000
  local lastBank, wasOnline, lastSentAt = NEVER, false, NEVER
  local function resetTimer() lastBank = bc.onLogin and NEVER or now end

  local function deposit()
    local cmd = trim(bc.command or "")
    if cmd == "" or not g_game.isOnline() then return false end
    say(cmd)
    lastBank, lastSentAt = now, now
    setStatus("Deposito enviado", "#88ff88")
    return true
  end

  bWin.command:setText(bc.command)
  bWin.command.onTextChange = function(w, t) bc.command = t end
  bWin.interval:setValue(bc.interval)
  bWin.interval.onValueChange = function(w, v) bc.interval = v end
  bWin.onLogin:setChecked(bc.onLogin)
  bWin.onLogin.onCheckChange = function(w, c) bc.onLogin = c end
  bWin.nowBtn.onClick = function() deposit() end
  bWin.closeBtn.onClick = function() bWin:hide() end
  bUI.setupBtn.onClick = function() UIx.toggleWindow(bWin) end

  UIx.bindSwitch(bc, bUI.switch, bWin.enableBtn, function(v)
    if v then resetTimer(); setStatus("Activo", "#66ff66")
    else setStatus("Inactivo", "#888888") end
  end)

  macro(1000, function()
    if not g_game.isOnline() then wasOnline = false; return end
    if not wasOnline then wasOnline = true; resetTimer() end
    if not bc.enabled then return end

    if trim(bc.command or "") == "" then
      setStatus("Sin comando (revisa Config)", "#ffaa44")
      return
    end

    local left = (bc.interval or 30) * 60000 - (now - lastBank)
    if left <= 0 then deposit(); return end
    if now - lastSentAt > 3000 then
      local s = math.ceil(left / 1000)
      setStatus(string.format("Activo - deposito en %d:%02d", math.floor(s / 60), s % 60), "#66ff66")
    end
  end)
end

-- ============================================================
-- AUTO STAMINA
--  - Usa el item de stamina cuando baja de X horas.
-- ============================================================
do
  local SK = "pzAutoStaminaV1"
  if type(storage[SK]) ~= "table" then
    storage[SK] = {enabled = false, itemId = 12008, hours = 40, exhaust = 2000}
  end
  local sc = storage[SK]
  sc.itemId = sc.itemId or 12008
  sc.hours = sc.hours or 40
  sc.exhaust = sc.exhaust or 2000

  g_ui.loadUIFromString([[
PzAutoStaminaWindow < MainWindow
  !text: tr('Auto Stamina')
  size: 380 270
  @onEscape: self:hide()

  VbTitle
    id: tItem
    anchors.top: parent.top
    anchors.left: parent.left
    text: Item de stamina

  BotItem
    id: item
    anchors.top: tItem.bottom
    anchors.left: parent.left
    margin-top: 4
    !tooltip: tr('Item que recupera stamina (arrastra aqui)')

  VbHint
    id: itemHint
    anchors.verticalCenter: item.verticalCenter
    anchors.left: item.right
    anchors.right: parent.right
    margin-left: 8
    text: Se usa por hotkey, no hace falta tener la mochila abierta.

  Label
    id: lblHours
    anchors.top: item.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: Usar si stamina <= (horas)

  SpinBox
    id: hours
    anchors.verticalCenter: lblHours.verticalCenter
    anchors.left: lblHours.right
    width: 50
    minimum: 1
    maximum: 42

  Label
    id: lblEx
    anchors.top: lblHours.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 200
    text: Pausa entre usos (ms)

  SpinBox
    id: exhaust
    anchors.verticalCenter: lblEx.verticalCenter
    anchors.left: lblEx.right
    width: 60
    minimum: 500
    maximum: 60000
    step: 100

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local sUI = UIx.scriptPanel("Auto Stamina")
  local sWin = UI.createWindow('PzAutoStaminaWindow', rootWidget)
  sWin:hide()

  local lastStatus = ""
  local function setStatus(t, c)
    if t == lastStatus then return end
    lastStatus = t
    UIx.setLabel(sUI.status, t, c)
    UIx.setLabel(sWin.status, t, c)
  end

  sWin.item:setItemId(sc.itemId)
  sWin.item.onItemChange = function(w) sc.itemId = w:getItemId() end
  sWin.hours:setValue(sc.hours)
  sWin.hours.onValueChange = function(w, v) sc.hours = v end
  sWin.exhaust:setValue(sc.exhaust)
  sWin.exhaust.onValueChange = function(w, v) sc.exhaust = v end
  sWin.closeBtn.onClick = function() sWin:hide() end
  sUI.setupBtn.onClick = function() UIx.toggleWindow(sWin) end

  UIx.bindSwitch(sc, sUI.switch, sWin.enableBtn, function(v)
    if not v then setStatus("Inactivo", "#888888") end
  end)

  local lastUse = -100000000
  local function fmt(m) return string.format("%d:%02d", math.floor(m / 60), m % 60) end

  macro(1000, function()
    if not sc.enabled or not g_game.isOnline() then return end
    local ok, stam = pcall(stamina)
    if not ok or type(stam) ~= "number" then
      setStatus("No se puede leer la stamina", "#ffaa44")
      return
    end
    if (sc.itemId or 0) <= 0 then
      setStatus("Stamina " .. fmt(stam) .. " - sin item (Config)", "#ffaa44")
      return
    end
    if stam <= (sc.hours or 40) * 60 then
      if now - lastUse >= (sc.exhaust or 2000) then
        use(sc.itemId)
        lastUse = now
      end
      setStatus("Stamina " .. fmt(stam) .. " - usando item", "#88ccff")
    else
      setStatus("Activo - stamina " .. fmt(stam), "#66ff66")
    end
  end)
end

end -- fin: 9. MAIN - PAZZUR
endSection(__sec)

-- #####################################################################
-- 10. HP - PAZZUR: Set Ataque/Defensa, Kina War Healer y Alarma PK
-- #####################################################################
__sec = startSection("HP")
do
setDefaultTab("HP")
UIx.header("PAZZUR - SET Y CURACION")
local function trim(s) return (tostring(s or "")):match("^%s*(.-)%s*$") end

-- ============================================================
-- SET PAZZUR (ATAQUE / DEFENSA)
--  Modo INTELIGENTE:
--   - Defensa si HP <= X % o si cae Y % en Z ms.
--   - Mantiene la defensa minimo N s y vuelve a ataque con HP >= W %.
--  Modo SOLO DEFENSA: deja siempre puesto el set de defensa
--   (el antiguo "Set Defensa").
--  Intenta poner todas las piezas a la vez, las importantes primero.
--  Se pausa si "Equipo Auto" esta activo (no usar los dos juntos).
-- ============================================================
do
  local PK = "pzSmartSetV1"
  local SLOTS = {
    {key = "body",   name = "Armad.", slot = SlotBody},
    {key = "head",   name = "Casco",  slot = SlotHead},
    {key = "neck",   name = "Amul.",  slot = SlotNeck},
    {key = "legs",   name = "Pier.",  slot = SlotLeg},
    {key = "feet",   name = "Botas",  slot = SlotFeet},
    {key = "finger", name = "Anillo", slot = SlotFinger},
    {key = "ammo",   name = "Ammo",   slot = SlotAmmo},
  }

  if type(storage[PK]) ~= "table" then
    storage[PK] = {
      enabled = false, mode = "smart",
      attackHp = 91, defenseHp = 61, holdSec = 5,
      burstDrop = 25, burstWindow = 500, openBags = true,
      attack  = {finger = 11792, neck = 9803, body = 13140, head = 13139,
                 legs = 13142, feet = 12068, ammo = 12013},
      defense = {finger = 3048, neck = 3081, body = 13118, head = 13117,
                 legs = 13119, feet = 13116, ammo = 12013},
    }
  end
  local pc = storage[PK]
  if pc.mode ~= "smart" and pc.mode ~= "defense" then pc.mode = "smart" end
  pc.attack, pc.defense = pc.attack or {}, pc.defense or {}
  pc.attackHp, pc.defenseHp = pc.attackHp or 91, pc.defenseHp or 61
  pc.holdSec = pc.holdSec or 5
  pc.burstDrop, pc.burstWindow = pc.burstDrop or 25, pc.burstWindow or 500
  if pc.openBags == nil then pc.openBags = true end

  g_ui.loadUIFromString([[
PzEquipColumn < Panel
  width: 40
  height: 98

  Label
    id: name
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text-align: center

  BotItem
    id: atk
    anchors.top: name.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    margin-top: 2

  BotItem
    id: def
    anchors.top: atk.bottom
    anchors.horizontalCenter: parent.horizontalCenter
    margin-top: 12

PzSetPanel < Panel
  height: 44

  Button
    id: setupBtn
    anchors.top: parent.top
    anchors.right: parent.right
    width: 48
    height: 20
    text: Config

  BotSwitch
    id: switch
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: setupBtn.left
    margin-right: 4
    height: 20
    text: Set Pazzur (Atq/Def)

  Button
    id: modeBtn
    anchors.top: switch.bottom
    anchors.left: parent.left
    anchors.right: parent.horizontalCenter
    margin-top: 3
    margin-right: 2
    height: 20
    text: Modo: INTELIGENTE

  Label
    id: status
    anchors.verticalCenter: modeBtn.verticalCenter
    anchors.left: parent.horizontalCenter
    anchors.right: parent.right
    margin-left: 2
    text-align: center
    color: #888888
    text: Inactivo

PzSetWindow < MainWindow
  !text: tr('Set Pazzur - Ataque / Defensa')
  size: 400 544
  @onEscape: self:hide()

  VbTitle
    id: tSets
    anchors.top: parent.top
    anchors.left: parent.left
    text: Sets de equipo

  Label
    id: lAtk
    anchors.top: tSets.bottom
    anchors.left: parent.left
    margin-top: 28
    width: 54
    color: #66ff66
    text: Ataque

  Label
    id: lDef
    anchors.top: tSets.bottom
    anchors.left: parent.left
    margin-top: 74
    width: 54
    color: #ff8866
    text: Defensa

  Panel
    id: cols
    anchors.top: tSets.bottom
    anchors.left: lAtk.right
    anchors.right: parent.right
    margin-top: 4
    height: 98
    layout:
      type: horizontalBox
      spacing: 2

  VbHint
    id: hint
    anchors.top: cols.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Arrastra los items a cada casilla. Casilla vacia = ese slot no se toca. Si 'Anillo y Amuleto' esta activo, aqui no se cambian anillo ni amuleto.

  HorizontalSeparator
    id: sep1
    anchors.top: hint.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6

  VbTitle
    id: tDef
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Modo inteligente

  Label
    id: lDefHp
    anchors.top: tDef.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 220
    text: Poner defensa si HP % <=

  SpinBox
    id: defHp
    anchors.verticalCenter: lDefHp.verticalCenter
    anchors.left: lDefHp.right
    width: 50
    minimum: 0
    maximum: 100

  Label
    id: lDrop
    anchors.top: lDefHp.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 220
    text: o si el HP cae de golpe (%)

  SpinBox
    id: drop
    anchors.verticalCenter: lDrop.verticalCenter
    anchors.left: lDrop.right
    width: 50
    minimum: 1
    maximum: 100

  Label
    id: lWin
    anchors.top: lDrop.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 220
    text: ...dentro de (ms)

  SpinBox
    id: burstWin
    anchors.verticalCenter: lWin.verticalCenter
    anchors.left: lWin.right
    width: 60
    minimum: 100
    maximum: 5000
    step: 100

  Label
    id: lHold
    anchors.top: lWin.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 220
    text: Mantener defensa minimo (s)

  SpinBox
    id: hold
    anchors.verticalCenter: lHold.verticalCenter
    anchors.left: lHold.right
    width: 50
    minimum: 1
    maximum: 60

  Label
    id: lAtkHp
    anchors.top: lHold.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 220
    text: Volver a ataque si HP % >=

  SpinBox
    id: atkHp
    anchors.verticalCenter: lAtkHp.verticalCenter
    anchors.left: lAtkHp.right
    width: 50
    minimum: 1
    maximum: 100

  CheckBox
    id: openBags
    anchors.top: lAtkHp.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: Abrir mochilas cerradas si no encuentra un item

  CheckBox
    id: keepBag
    anchors.top: openBags.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Devolver la pieza quitada a la mochila del reemplazo

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: modeBtn
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 130
    text: Modo: INTELIGENTE

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local pUI = setupUI("PzSetPanel\n  height: 44")
  local pWin = UI.createWindow('PzSetWindow', rootWidget)
  pWin:hide()

  for _, s in ipairs(SLOTS) do
    local col = UI.createWidget('PzEquipColumn', pWin.cols)
    col.name:setText(s.name)
    col.atk:setItemId(pc.attack[s.key] or 0)
    col.def:setItemId(pc.defense[s.key] or 0)
    col.atk.onItemChange = function(w) pc.attack[s.key]  = w:getItemId() end
    col.def.onItemChange = function(w) pc.defense[s.key] = w:getItemId() end
  end

  pWin.defHp:setValue(pc.defenseHp)
  pWin.defHp.onValueChange = function(w, v) pc.defenseHp = v end
  pWin.drop:setValue(pc.burstDrop)
  pWin.drop.onValueChange = function(w, v) pc.burstDrop = v end
  pWin.burstWin:setValue(pc.burstWindow)
  pWin.burstWin.onValueChange = function(w, v) pc.burstWindow = v end
  pWin.hold:setValue(pc.holdSec)
  pWin.hold.onValueChange = function(w, v) pc.holdSec = v end
  pWin.atkHp:setValue(pc.attackHp)
  pWin.atkHp.onValueChange = function(w, v) pc.attackHp = v end
  pWin.openBags:setChecked(pc.openBags)
  pWin.openBags.onCheckChange = function(w, c) pc.openBags = c end
  EquipCore.bindKeepBag(pWin.keepBag)

  local function updateMode()
    local txt = (pc.mode == "defense") and "Modo: SOLO DEFENSA" or "Modo: INTELIGENTE"
    pUI.modeBtn:setText(txt)
    pWin.modeBtn:setText(txt)
  end
  local function toggleMode()
    pc.mode = (pc.mode == "smart") and "defense" or "smart"
    updateMode()
  end
  updateMode()
  pUI.modeBtn.onClick = toggleMode
  pWin.modeBtn.onClick = toggleMode
  pWin.closeBtn.onClick = function() pWin:hide() end
  pUI.setupBtn.onClick = function() UIx.toggleWindow(pWin) end

  local lastStatus = ""
  local function setStatus(t, c)
    if t == lastStatus then return end
    lastStatus = t
    UIx.setLabel(pUI.status, t, c)
    UIx.setLabel(pWin.status, t, c)
  end

  local inDefense, defenseUntil, samples = false, 0, {}
  UIx.bindSwitch(pc, pUI.switch, pWin.enableBtn, function(v)
    inDefense, samples = false, {}
    if not v then setStatus("Inactivo", "#888888") end
  end)

  local function otherOn(key)
    local t = storage[key]
    return type(t) == "table" and t.enabled == true
  end

  local function managed(key)
    return not (otherOn("ringAmuletV2") and (key == "finger" or key == "neck"))
  end

  -- Intenta poner TODAS las piezas en el mismo ciclo
  local function equipAll(set)
    local missing = false
    for _, s in ipairs(SLOTS) do
      if managed(s.key) and (set[s.key] or 0) > 0 then
        if EquipCore.equip(s.slot, set[s.key]) then missing = true end
      end
    end
    if missing and pc.openBags then EquipCore.openNextBag() end
  end

  local function burstDetected(hp)
    table.insert(samples, {t = now, hp = hp})
    while #samples > 0 and now - samples[1].t > (pc.burstWindow or 500) do
      table.remove(samples, 1)
    end
    local top = hp
    for _, s in ipairs(samples) do
      if s.hp > top then top = s.hp end
    end
    return top - hp >= (pc.burstDrop or 25)
  end

  local function pzTick()
    if not pc.enabled or not g_game.isOnline() then return end
    if otherOn("equipAutoV2") then
      setStatus("Pausado: 'Equipo Auto' activo", "#ffaa44")
      return
    end
    local hp = hppercent()
    if not hp or hp <= 0 then return end

    if pc.mode == "defense" then
      setStatus("SOLO DEFENSA", "#ff8866")
      equipAll(pc.defense)
      return
    end

    if hp <= (pc.defenseHp or 61) or burstDetected(hp) then
      inDefense = true
      defenseUntil = now + (pc.holdSec or 5) * 1000
      samples = {}
    end

    if inDefense then
      local left = math.max(0, math.ceil((defenseUntil - now) / 1000))
      setStatus(left > 0 and ("DEFENSA (" .. left .. " s)") or "DEFENSA (esperando HP)", "#ff8866")
      equipAll(pc.defense)
      if now < defenseUntil or hp < (pc.attackHp or 91) then return end
      inDefense = false
      samples = {}
    end

    if hp >= (pc.attackHp or 91) then
      setStatus("ATAQUE", "#66ff66")
      equipAll(pc.attack)
    end
  end
  macro(50, pzTick)
  EquipCore.addKick(pzTick)
  -- Reaccionar en el mismo instante en que baja/sube la vida
  pcall(function()
    onPlayerHealthChange(function() pzTick() end)
  end)
end

-- ============================================================
-- KINA WAR HEALER (Pazzur)
--  POCIONES
--   - Especiales por rango de HP (Inmortal, Recovery, Adrenalina):
--     al entrar en su rango tienen prioridad durante una ventana
--     corta; despues vuelve la pocion de vida.
--   - Pocion de vida con HP <= X (nunca queda desactivada).
--  HECHIZOS
--   - Critico (ultimate tempo): prioridad absoluta en su rango.
--   - Fuerte (exana gran mort): si esta en cooldown usa el Normal.
--   - Normal (exana mort).
--  Se pausa si "War Healer" esta activo (no usar los dos juntos).
-- ============================================================
do
  local KK = "pzKinaHealerV1"
  local SPECIAL_DEF = {
    {key = "inmortal",   name = "Inmortal",   id = 12081, min = 5,  max = 20},
    {key = "recovery",   name = "Recovery",   id = 11767, min = 21, max = 35},
    {key = "adrenalina", name = "Adrenalina", id = 11846, min = 36, max = 55},
  }
  local SPELL_DEF = {
    {key = "ultimate", name = "Critico", words = "ultimate tempo",  min = 1,  max = 18, delay = 500},
    {key = "gran",     name = "Fuerte",  words = "exana gran mort", min = 19, max = 45, delay = 15000},
    {key = "mort",     name = "Normal",  words = "exana mort",      min = 19, max = 65, delay = 1000},
  }

  if type(storage[KK]) ~= "table" then
    storage[KK] = {enabled = false}
  end
  local kc = storage[KK]
  kc.health = kc.health or {id = 7643, hp = 96, delay = 200}
  kc.specialRetry = kc.specialRetry or 300
  kc.specialWindow = kc.specialWindow or 400
  kc.specials = kc.specials or {}
  kc.spells = kc.spells or {}
  for i, d in ipairs(SPECIAL_DEF) do
    kc.specials[i] = kc.specials[i] or {id = d.id, min = d.min, max = d.max}
  end
  for _, d in ipairs(SPELL_DEF) do
    kc.spells[d.key] = kc.spells[d.key] or {words = d.words, min = d.min, max = d.max, delay = d.delay}
  end

  g_ui.loadUIFromString([[
PzSpecialRow < Panel
  height: 36

  BotItem
    id: item
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter

  Label
    id: name
    anchors.left: item.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 8
    width: 80

  Label
    id: lMin
    anchors.left: name.right
    anchors.verticalCenter: parent.verticalCenter
    width: 40
    text: HP de

  SpinBox
    id: min
    anchors.left: lMin.right
    anchors.verticalCenter: parent.verticalCenter
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lMax
    anchors.left: min.right
    anchors.verticalCenter: parent.verticalCenter
    width: 18
    text-align: center
    text: a

  SpinBox
    id: max
    anchors.left: lMax.right
    anchors.verticalCenter: parent.verticalCenter
    width: 45
    minimum: 0
    maximum: 100

PzSpellRow < Panel
  height: 26

  Label
    id: name
    anchors.left: parent.left
    anchors.verticalCenter: parent.verticalCenter
    width: 50

  TextEdit
    id: words
    anchors.left: name.right
    anchors.verticalCenter: parent.verticalCenter
    width: 110
    height: 20
    !tooltip: tr('Palabras del hechizo (vacio = apagado)')

  Label
    id: lMin
    anchors.left: words.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    width: 22
    text: HP

  SpinBox
    id: min
    anchors.left: lMin.right
    anchors.verticalCenter: parent.verticalCenter
    width: 42
    minimum: 0
    maximum: 100

  Label
    id: lMax
    anchors.left: min.right
    anchors.verticalCenter: parent.verticalCenter
    width: 14
    text-align: center
    text: a

  SpinBox
    id: max
    anchors.left: lMax.right
    anchors.verticalCenter: parent.verticalCenter
    width: 42
    minimum: 0
    maximum: 100

  Label
    id: lDelay
    anchors.left: max.right
    anchors.verticalCenter: parent.verticalCenter
    margin-left: 6
    width: 22
    text: ms

  SpinBox
    id: delay
    anchors.left: lDelay.right
    anchors.verticalCenter: parent.verticalCenter
    width: 62
    minimum: 100
    maximum: 600000
    step: 100
    !tooltip: tr('Cooldown / pausa entre usos en milisegundos')

PzKinaWindow < MainWindow
  !text: tr('Kina War Healer (Pazzur)')
  size: 440 600
  @onEscape: self:hide()

  VbTitle
    id: tHealth
    anchors.top: parent.top
    anchors.left: parent.left
    text: Pocion de vida

  BotItem
    id: healthItem
    anchors.top: tHealth.bottom
    anchors.left: parent.left
    margin-top: 4

  Label
    id: lHealthHp
    anchors.verticalCenter: healthItem.verticalCenter
    anchors.left: healthItem.right
    margin-left: 8
    width: 50
    text: HP <=

  SpinBox
    id: healthHp
    anchors.verticalCenter: healthItem.verticalCenter
    anchors.left: lHealthHp.right
    width: 45
    minimum: 0
    maximum: 100

  Label
    id: lHealthDelay
    anchors.verticalCenter: healthItem.verticalCenter
    anchors.left: healthHp.right
    margin-left: 12
    width: 60
    text: cada (ms)

  SpinBox
    id: healthDelay
    anchors.verticalCenter: healthItem.verticalCenter
    anchors.left: lHealthDelay.right
    width: 55
    minimum: 100
    maximum: 5000
    step: 50

  HorizontalSeparator
    id: sep1
    anchors.top: healthItem.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  VbTitle
    id: tSpecial
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Pociones especiales (prioridad corta)

  Panel
    id: specials
    anchors.top: tSpecial.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 112
    layout:
      type: verticalBox
      spacing: 2

  Label
    id: lWindow
    anchors.top: specials.bottom
    anchors.left: parent.left
    margin-top: 8
    width: 220
    text: Prioridad sobre la de vida (ms)

  SpinBox
    id: specialWindow
    anchors.verticalCenter: lWindow.verticalCenter
    anchors.left: lWindow.right
    width: 60
    minimum: 0
    maximum: 5000
    step: 50

  Label
    id: lRetry
    anchors.top: lWindow.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 220
    text: Reintento pocion especial (ms)

  SpinBox
    id: specialRetry
    anchors.verticalCenter: lRetry.verticalCenter
    anchors.left: lRetry.right
    width: 60
    minimum: 100
    maximum: 5000
    step: 50

  HorizontalSeparator
    id: sep2
    anchors.top: lRetry.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10

  VbTitle
    id: tSpells
    anchors.top: sep2.bottom
    anchors.left: parent.left
    margin-top: 6
    text: Hechizos

  Panel
    id: spells
    anchors.top: tSpells.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 82
    layout:
      type: verticalBox
      spacing: 2

  VbHint
    id: hint
    anchors.top: spells.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Critico tiene prioridad absoluta en su rango. Fuerte va primero en su rango y, si esta en cooldown, usa Normal. Item o hechizo vacio = apagado.

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: defaultsBtn
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 130
    text: Valores por defecto

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local kUI = UIx.scriptPanel("Kina War Healer")
  local kWin = UI.createWindow('PzKinaWindow', rootWidget)
  kWin:hide()

  local NEVER = -100000000
  local lastStatus, lastActAt = "", NEVER
  local function setStatus(t, c)
    if t == lastStatus then return end
    lastStatus = t
    UIx.setLabel(kUI.status, t, c)
    UIx.setLabel(kWin.status, t, c)
  end
  local function act(t, c) lastActAt = now; setStatus(t, c) end

  -- Pocion de vida
  local h = kc.health
  kWin.healthItem.onItemChange = function(w) h.id = w:getItemId() end
  kWin.healthHp.onValueChange = function(w, v) h.hp = v end
  kWin.healthDelay.onValueChange = function(w, v) h.delay = v end
  kWin.specialWindow.onValueChange = function(w, v) kc.specialWindow = v end
  kWin.specialRetry.onValueChange = function(w, v) kc.specialRetry = v end

  -- Filas de pociones especiales
  local specialRows = {}
  for i, d in ipairs(SPECIAL_DEF) do
    local row = UI.createWidget('PzSpecialRow', kWin.specials)
    local sp = kc.specials[i]
    row.name:setText(d.name)
    row.item.onItemChange = function(w) sp.id = w:getItemId() end
    row.min.onValueChange = function(w, v) sp.min = v end
    row.max.onValueChange = function(w, v) sp.max = v end
    specialRows[i] = row
  end

  -- Filas de hechizos
  local spellRows = {}
  for _, d in ipairs(SPELL_DEF) do
    local row = UI.createWidget('PzSpellRow', kWin.spells)
    local s = kc.spells[d.key]
    row.name:setText(d.name)
    row.words.onTextChange = function(w, t) s.words = t end
    row.min.onValueChange = function(w, v) s.min = v end
    row.max.onValueChange = function(w, v) s.max = v end
    row.delay.onValueChange = function(w, v) s.delay = v end
    spellRows[d.key] = row
  end

  local function loadValues()
    kWin.healthItem:setItemId(h.id or 0)
    kWin.healthHp:setValue(h.hp or 0)
    kWin.healthDelay:setValue(h.delay or 200)
    kWin.specialWindow:setValue(kc.specialWindow)
    kWin.specialRetry:setValue(kc.specialRetry)
    for i, row in ipairs(specialRows) do
      local sp = kc.specials[i]
      row.item:setItemId(sp.id or 0)
      row.min:setValue(sp.min or 0)
      row.max:setValue(sp.max or 0)
    end
    for key, row in pairs(spellRows) do
      local s = kc.spells[key]
      row.words:setText(s.words or "")
      row.min:setValue(s.min or 0)
      row.max:setValue(s.max or 0)
      row.delay:setValue(s.delay or 1000)
    end
  end
  loadValues()

  local confirmUntil = 0
  kWin.defaultsBtn.onClick = function()
    if now > confirmUntil then
      confirmUntil = now + 3000
      kWin.defaultsBtn:setText("Confirmar?")
      schedule(3000, function() kWin.defaultsBtn:setText("Valores por defecto") end)
      return
    end
    confirmUntil = 0
    kWin.defaultsBtn:setText("Valores por defecto")
    h.id, h.hp, h.delay = 7643, 96, 200
    kc.specialWindow, kc.specialRetry = 400, 300
    for i, d in ipairs(SPECIAL_DEF) do
      local sp = kc.specials[i]
      sp.id, sp.min, sp.max = d.id, d.min, d.max
    end
    for _, d in ipairs(SPELL_DEF) do
      local s = kc.spells[d.key]
      s.words, s.min, s.max, s.delay = d.words, d.min, d.max, d.delay
    end
    loadValues()
  end

  kWin.closeBtn.onClick = function() kWin:hide() end
  kUI.setupBtn.onClick = function() UIx.toggleWindow(kWin) end

  UIx.bindSwitch(kc, kUI.switch, kWin.enableBtn, function(v)
    if v then setStatus("Activo", "#66ff66") else setStatus("Inactivo", "#888888") end
  end)

  local function warHealerOn()
    local t = storage.warHealerV9
    return type(t) == "table" and t.enabled == true
  end

  local function inRange(hp, a, b) return hp >= (a or 0) and hp <= (b or -1) end
  local function ready(last, delay) return now - last >= (delay or 0) end

  local lastHealth, lastSpecialTry = NEVER, NEVER
  local specialIdx, specialStart = nil, 0
  local lastSpell = {ultimate = NEVER, gran = NEVER, mort = NEVER}

  local function cast(key)
    local s = kc.spells[key]
    local w = trim(s.words or ""):lower()
    if w == "" or not ready(lastSpell[key], s.delay) then return false end
    say(w)
    lastSpell[key] = now
    Shared.lastSelfHeal = now
    act("Hechizo: " .. w, "#88ff88")
    return true
  end

  macro(100, function()
    if not kc.enabled or not g_game.isOnline() then return end
    if warHealerOn() then
      setStatus("Pausado: 'War Healer' activo", "#ffaa44")
      return
    end
    local hp = hppercent()
    if not hp or hp <= 0 then return end

    -- ===== CANAL DE HECHIZOS =====
    local S = kc.spells
    if trim(S.ultimate.words or "") ~= "" and inRange(hp, S.ultimate.min, S.ultimate.max) then
      -- Zona critica: solo el hechizo critico (no le roba el exhaust)
      cast("ultimate")
    else
      local done = false
      if inRange(hp, S.gran.min, S.gran.max) then done = cast("gran") end
      if not done and inRange(hp, S.mort.min, S.mort.max) then cast("mort") end
    end

    -- ===== CANAL DE POCIONES =====
    local want, wantIdx
    for i, sp in ipairs(kc.specials) do
      if (sp.id or 0) > 0 and inRange(hp, sp.min, sp.max) then
        want, wantIdx = sp, i
        break
      end
    end

    -- Cambio de zona: nueva ventana de prioridad
    if wantIdx ~= specialIdx then
      specialIdx = wantIdx
      specialStart = now
      lastSpecialTry = NEVER
    end

    if want and now - specialStart <= (kc.specialWindow or 400) then
      if ready(lastSpecialTry, kc.specialRetry) and not EquipCore.holdPotion(hp) then
        useWith(want.id, player)
        lastSpecialTry = now
        Shared.lastSelfPotion = now
        Shared.lastUseId, Shared.lastUseAt = want.id, now
        act("Pocion " .. SPECIAL_DEF[wantIdx].name, "#88ccff")
      end
      return   -- solo durante la ventana se aparta la pocion de vida
    end

    if (h.id or 0) > 0 and hp <= (h.hp or 0) and ready(lastHealth, h.delay)
       and not EquipCore.holdPotion(hp) then
      useWith(h.id, player)
      lastHealth = now
      Shared.lastSelfPotion = now
      Shared.lastUseId, Shared.lastUseAt = h.id, now
      if now - lastActAt > 600 then act("Pocion de vida", "#88ff88") end
    end

    if now - lastActAt > 2000 then setStatus("Activo", "#66ff66") end
  end)
end

-- ============================================================
-- ALARMA PK (calavera blanca, roja o negra)
--  - Sonido cada 3 s mientras haya un PK en pantalla.
--  - Aviso a Telegram (en el celular vibra y enciende la pantalla).
--  - Un solo mensaje por PK: no se repite mientras siga en pantalla.
--  - No avisa si TU tienes skull.
--  - Boton "Config": token, chat id, nombres VIP, sonido y "Probar".
--  - Los de tu party no cuentan.
--  - VIP: avisa (sonido + Telegram) cuando se CONECTA alguno de los
--    nombres que escribas. Tienen que estar en tu lista VIP. Funciona con
--    la ventana VIP cerrada. Al entrar al juego no avisa de los que ya
--    estaban conectados.
-- ============================================================
do
  local AL = "pkAlarmV1"
  if type(storage[AL]) ~= "table" then
    storage[AL] = {enabled = false, sound = true, tgToken = "", tgChat = "", repeatSec = 60}
  end
  local al = storage[AL]

  g_ui.loadUIFromString([[
PkAlarmWindow < MainWindow
  !text: tr('Alarma PK')
  size: 380 340
  @onEscape: self:hide()

  Label
    id: lToken
    anchors.top: parent.top
    anchors.left: parent.left
    text: Telegram token del bot:

  TextEdit
    id: tgToken
    anchors.top: lToken.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 22

  Label
    id: lChat
    anchors.top: tgToken.bottom
    anchors.left: parent.left
    margin-top: 8
    text: Telegram chat id:

  TextEdit
    id: tgChat
    anchors.top: lChat.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 22

  Label
    id: lVip
    anchors.top: tgChat.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Avisar si se conectan (VIP, separados por coma):

  TextEdit
    id: vipNames
    anchors.top: lVip.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 22

  CheckBox
    id: sound
    anchors.top: vipNames.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10
    text: Sonido de alarma

  VbHint
    id: hint
    anchors.top: sound.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Los VIP tienen que estar en tu lista VIP. No hace falta tener abierta la ventana VIP.

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: testBtn
    anchors.bottom: parent.bottom
    anchors.left: enableBtn.right
    margin-left: 6
    width: 70
    text: Probar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  UIx.header("ALARMA PK")
  local aUI = UIx.scriptPanel("Alarma PK")
  local aWin = UI.createWindow('PkAlarmWindow', rootWidget)
  aWin:hide()
  if al.sound == nil then al.sound = true end

  aWin.tgToken:setText(al.tgToken or "")
  aWin.tgToken.onTextChange = function(w, t) al.tgToken = trim(t) end
  aWin.tgChat:setText(al.tgChat or "")
  aWin.tgChat.onTextChange = function(w, t) al.tgChat = trim(t) end
  aWin.vipNames:setText(al.vipNames or "")
  aWin.vipNames.onTextChange = function(w, t) al.vipNames = t end
  aWin.sound:setChecked(al.sound)
  aWin.sound.onCheckChange = function(w, c) al.sound = c end
  aWin.closeBtn.onClick = function() aWin:hide() end
  aUI.setupBtn.onClick = function() UIx.toggleWindow(aWin) end

  local lastSt = ""
  local function setSt(t, c)
    if t == lastSt then return end
    lastSt = t
    UIx.setLabel(aUI.status, t, c)
    UIx.setLabel(aWin.status, t, c)
  end

  local function urlEnc(s)
    return (s:gsub("[^%w%-_%.~]", function(ch) return string.format("%%%02X", ch:byte()) end))
  end
  local function telegram(msg)
    if (al.tgToken or "") == "" or (al.tgChat or "") == "" then return false end
    pcall(function()
      HTTP.get("https://api.telegram.org/bot" .. al.tgToken .. "/sendMessage?chat_id="
        .. urlEnc(al.tgChat) .. "&text=" .. urlEnc(msg), function() end)
    end)
    return true
  end

  local lastSound = -1000000
  local function sound()
    pcall(function() g_window.flash() end)
    if al.sound and now - lastSound >= 3000 then
      lastSound = now
      pcall(function() playSound("/sounds/alarm.ogg") end)
    end
  end

  aWin.testBtn.onClick = function()
    lastSound = -1000000
    sound()
    local sent = telegram("[Prueba] Alarma PK de " .. (player and player:getName() or "?"))
    setSt(sent and "Prueba enviada" or "Prueba: falta token / chat id", sent and "#88ccff" or "#ffaa44")
  end

  -- ----- VIP: aviso cuando se conecta un nombre de la lista -----
  local vipText, vipWatch = nil, {}
  local function getWatch()
    local t = al.vipNames or ""
    if t ~= vipText then
      vipText, vipWatch = t, {}
      for n in t:gmatch("[^,]+") do
        n = trim(n):lower()
        if n ~= "" then vipWatch[n] = true end
      end
    end
    return vipWatch
  end

  -- Lee quien de la lista VIP esta conectado: {nombre_minusculas = true/false}.
  -- 1) datos del juego (no depende de la ventana VIP)
  -- 2) respaldo: la lista del modulo VIP (existe aunque este cerrada)
  local function readVips()
    local res, got = {}, false
    pcall(function()
      local vips = g_game.getVips()
      if type(vips) ~= "table" then return end
      for _, v in pairs(vips) do
        if type(v) == "table" then
          local name = v[1] or v.name
          local st = v[2] or v.status or v.state
          if type(name) == "string" then
            res[name:lower()] = (st == 1)
            got = true
          end
        end
      end
    end)
    if got then return res end
    pcall(function()
      local vl = modules.game_viplist
      local win = vl and (vl.vipWindow or (vl.getVipWindow and vl.getVipWindow()))
      if not win then return end
      local panel = win:recursiveGetChildById('contentsPanel') or win
      for _, ch in ipairs(panel:getChildren()) do
        local okn, name = pcall(function() return ch:getText() end)
        if okn and type(name) == "string" and name ~= "" and ch.vipState ~= nil then
          res[name:lower()] = (ch.vipState == 1)
          got = true
        end
      end
    end)
    return got and res or nil
  end

  local vipPrev, vipLastAlert = nil, {}
  local vipMsg, vipMsgUntil = "", 0
  local VIP_REPEAT_MS = 2 * 60 * 1000
  macro(3000, function()
    if not g_game.isOnline() then vipPrev = nil; return end
    if not al.enabled then return end
    local watch = getWatch()
    local any = false
    for _ in pairs(watch) do any = true; break end
    if not any then return end
    local cur = readVips()
    if not cur then return end
    -- Primera lectura (al entrar): solo guarda, no avisa
    if not vipPrev then vipPrev = cur; return end
    local fresh = {}
    for n in pairs(watch) do
      if cur[n] and not vipPrev[n] and now - (vipLastAlert[n] or -100000000) >= VIP_REPEAT_MS then
        vipLastAlert[n] = now
        table.insert(fresh, n)
      end
    end
    vipPrev = cur
    if #fresh > 0 then
      lastSound = -1000000
      sound()
      telegram("VIP conectado (" .. (player and player:getName() or "?") .. "): "
        .. table.concat(fresh, ", "))
      vipMsg, vipMsgUntil = "VIP conectado: " .. table.concat(fresh, ", "), now + 15000
      setSt(vipMsg, "#ffcc00")
    end
  end)

  UIx.bindSwitch(al, aUI.switch, aWin.enableBtn, function(v)
    setSt(v and "Activo" or "Inactivo", v and "#66ff66" or "#888888")
  end)

  local notified, GONE_MS = {}, 5 * 60 * 1000
  macro(500, function()
    if not al.enabled or not g_game.isOnline() then return end
    local list = Shared.pkList()
    if #list == 0 then
      if now < vipMsgUntil then setSt(vipMsg, "#ffcc00")
      else setSt("Activo - sin PK", "#66ff66") end
      return
    end

    if Shared.iAmPk() then
      setSt("Tienes skull: alarma en pausa", "#aaaaaa")
      return
    end

    -- Solo avisa cuando el PK APARECE. Si sigue en pantalla no se
    -- repite; vuelve a avisar solo si se fue mas de 5 min y regresa.
    local names, fresh = {}, {}
    for _, s in ipairs(list) do
      local n = s:getName() or "?"
      table.insert(names, n)
      if now - (notified[n] or -100000000) >= GONE_MS then
        table.insert(fresh, n)
      end
      notified[n] = now
    end
    sound()
    if #fresh > 0 then
      telegram("PK en pantalla (" .. (player and player:getName() or "?") .. "): "
        .. table.concat(fresh, ", "))
    end
    setSt("PK: " .. table.concat(names, ", "), "#ff4444")
  end)
end

end -- fin: 10. HP - PAZZUR
endSection(__sec)

-- =====================================================================
-- 11. HP - AUTO COMIDA (reemplaza al "Eat Food" de vBot)
--  - 4 casillas para elegir comida (usa la primera que encuentre).
--  - Come solo cuando hace falta: si el servidor manda el tiempo de
--    regeneracion, come cuando baja del minimo; si no lo manda, come
--    hasta "You are full" y luego descansa X minutos.
--  - "You are full" -> pausa (no intenta comer cada segundo).
--  - No come con PK en pantalla (opcional), ni con vida baja, ni justo
--    despues de una pocion (no le roba el exhaust a los healers).
--  - Apaga el "Eat Food" de vBot para que no coman los dos (opcional).
--  - Si la comida no esta en una mochila abierta, la usa por hotkey.
-- =====================================================================
__sec = startSection("HP")
do
  local FC = "autoFoodV1"
  local DEF = {
    enabled = false,
    foods = {3582, 3577, 3725, 3731},   -- ham, meat, brown mushroom, fire mushroom
    minRegen = 600,      -- come si la regeneracion baja de esto (seg)
    fullMin = 3,         -- minutos de pausa tras "You are full"
    minHp = 70,          -- no come con vida por debajo de esto (%)
    pausePk = true,
    killVbot = true,
  }
  if type(storage[FC]) ~= "table" then storage[FC] = {} end
  local fc = storage[FC]
  for k, v in pairs(DEF) do if fc[k] == nil then fc[k] = v end end
  if type(fc.foods) ~= "table" then fc.foods = {3582, 3577, 3725, 3731} end

  local EAT_RETRY = 1500     -- entre bocados mientras no este lleno
  local POT_GAP   = 1200     -- espera tras una pocion antes de comer

  g_ui.loadUIFromString([[
AutoFoodWindow < MainWindow
  !text: tr('Auto Comida')
  size: 360 330
  @onEscape: self:hide()

  VbTitle
    id: tFoods
    anchors.top: parent.top
    anchors.left: parent.left
    text: Comidas (en orden de prioridad)

  BotItem
    id: food1
    anchors.top: tFoods.bottom
    anchors.left: parent.left
    margin-top: 4

  BotItem
    id: food2
    anchors.top: food1.top
    anchors.left: food1.right
    margin-left: 6

  BotItem
    id: food3
    anchors.top: food1.top
    anchors.left: food2.right
    margin-left: 6

  BotItem
    id: food4
    anchors.top: food1.top
    anchors.left: food3.right
    margin-left: 6

  VbHint
    id: hFoods
    anchors.top: food1.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    text: Arrastra la comida a las casillas. Deja vacia la que no uses.

  HorizontalSeparator
    id: sep1
    anchors.top: hFoods.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  Label
    id: lRegen
    anchors.top: sep1.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 190
    text: Comer si regeneracion < (seg)

  SpinBox
    id: minRegen
    anchors.verticalCenter: lRegen.verticalCenter
    anchors.left: lRegen.right
    width: 60
    minimum: 60
    maximum: 1200
    step: 60

  Label
    id: lFull
    anchors.top: lRegen.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 190
    text: Pausa tras "You are full" (min)

  SpinBox
    id: fullMin
    anchors.verticalCenter: lFull.verticalCenter
    anchors.left: lFull.right
    width: 60
    minimum: 1
    maximum: 30
    step: 1

  Label
    id: lHp
    anchors.top: lFull.bottom
    anchors.left: parent.left
    margin-top: 12
    width: 190
    text: No comer con vida menor a (%)

  SpinBox
    id: minHp
    anchors.verticalCenter: lHp.verticalCenter
    anchors.left: lHp.right
    width: 60
    minimum: 0
    maximum: 100
    step: 5

  CheckBox
    id: pausePk
    anchors.top: lHp.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 12
    text: No comer con PK en pantalla

  CheckBox
    id: killVbot
    anchors.top: pausePk.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Apagar el Eat Food de vBot

  HorizontalSeparator
    id: sepBottom
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: status.top
    margin-bottom: 4

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  UIx.header("COMIDA")
  local fUI = UIx.scriptPanel("Auto Comida")
  local fWin = UI.createWindow('AutoFoodWindow', rootWidget)
  fWin:hide()

  local lastSt = ""
  local function setSt(t, c)
    if t == lastSt then return end
    lastSt = t
    UIx.setLabel(fUI.status, t, c)
    UIx.setLabel(fWin.status, t, c)
  end

  -- Casillas de comida
  for i = 1, 4 do
    local slot = fWin["food" .. i]
    slot:setItemId(fc.foods[i] or 0)
    slot.onItemChange = function(w) fc.foods[i] = w:getItemId() end
  end

  fWin.minRegen:setValue(fc.minRegen)
  fWin.minRegen.onValueChange = function(w, v) fc.minRegen = v end
  fWin.fullMin:setValue(fc.fullMin)
  fWin.fullMin.onValueChange = function(w, v) fc.fullMin = v end
  fWin.minHp:setValue(fc.minHp)
  fWin.minHp.onValueChange = function(w, v) fc.minHp = v end
  fWin.pausePk:setChecked(fc.pausePk)
  fWin.pausePk.onCheckChange = function(w, c) fc.pausePk = c end
  fWin.killVbot:setChecked(fc.killVbot)
  fWin.killVbot.onCheckChange = function(w, c) fc.killVbot = c end

  fWin.closeBtn.onClick = function() fWin:hide() end
  fUI.setupBtn.onClick = function() UIx.toggleWindow(fWin) end

  -- ----- Apagar el "Eat Food" de vBot (para que no coman los dos) -----
  local vbSw, vbTries, vbLast = nil, 0, -1000000
  local function findVbotEat()
    local found
    local function walk(w, depth)
      if found or depth > 40 then return end
      local ok, txt = pcall(function() return w:getText() end)
      if ok and type(txt) == "string" and txt:lower() == "eat food"
         and w.onClick and w.isOn then
        found = w
        return
      end
      local okc, kids = pcall(function() return w:getChildren() end)
      if okc and kids then
        for _, k in ipairs(kids) do
          walk(k, depth + 1)
          if found then return end
        end
      end
    end
    pcall(function() walk(g_ui.getRootWidget(), 0) end)
    return found
  end
  local function offVbotEat()
    if not fc.killVbot then return end
    if not vbSw then
      if vbTries >= 5 or now - vbLast < 30000 then return end
      vbTries, vbLast = vbTries + 1, now
      vbSw = findVbotEat()
      if not vbSw then return end
    end
    local ok, on = pcall(function() return vbSw:isOn() end)
    if ok and on then pcall(function() vbSw.onClick(vbSw) end) end
  end

  -- ----- Estado de comida -----
  local nextTry, fullUntil, pkSeenAt = 0, 0, -1000000
  local hotkeyIdx = 0

  onTextMessage(function(mode, text)
    local t = (text or ""):lower()
    if t:find("you are full", 1, true) or t:find("estas lleno", 1, true)
       or t:find("estás lleno", 1, true) then
      fullUntil = now + (fc.fullMin or 3) * 60000
      nextTry = fullUntil
    end
  end)

  local function regenSec()
    local ok, r = pcall(function() return player:getRegenerationTime() end)
    if ok and type(r) == "number" then return r end
    return 0
  end

  local function foodList()
    local res = {}
    for i = 1, 4 do
      local id = fc.foods[i] or 0
      if id > 0 then table.insert(res, id) end
    end
    return res
  end

  local function eat()
    local ids = foodList()
    if #ids == 0 then return false, "Sin comida elegida" end
    -- 1) Comida en mochilas abiertas (en orden de prioridad)
    for _, id in ipairs(ids) do
      local item = findItem(id)
      if item then
        g_game.use(item)
        return true, id
      end
    end
    -- 2) Por hotkey (mochilas cerradas), va rotando las casillas
    hotkeyIdx = hotkeyIdx % #ids + 1
    local id = ids[hotkeyIdx]
    pcall(function() g_game.useInventoryItem(id) end)
    return true, id
  end

  UIx.bindSwitch(fc, fUI.switch, fWin.enableBtn, function(v)
    setSt(v and "Activo" or "Inactivo", v and "#66ff66" or "#888888")
  end)

  macro(250, function()
    if not fc.enabled or not g_game.isOnline() then return end
    offVbotEat()

    -- PK en pantalla
    if fc.pausePk and not Shared.inPz() and #Shared.pkList() > 0 then
      pkSeenAt = now
    end
    if now - pkSeenAt < 5000 then
      setSt("Pausa: PK en pantalla", "#ffaa44")
      return
    end

    -- Lleno ("You are full")
    if now < fullUntil then
      setSt("Lleno - vuelve a comer en " .. math.ceil((fullUntil - now) / 1000) .. " s", "#66ff66")
      return
    end

    -- Regeneracion (si el servidor la manda)
    local regen = regenSec()
    if regen >= (fc.minRegen or 600) then
      setSt("Lleno (regeneracion " .. regen .. " s)", "#66ff66")
      return
    end

    -- Prioridad a la curacion
    local hp = hppercent() or 100
    if hp < (fc.minHp or 70) then
      setSt("Espera: vida baja (" .. hp .. "%)", "#ffaa44")
      return
    end
    if now - (Shared.lastSelfPotion or -1000000) < POT_GAP then return end

    if now < nextTry then return end
    local ok, info = eat()
    nextTry = now + EAT_RETRY
    if ok then
      setSt("Comiendo (ID " .. info .. ")", "#88ccff")
    else
      setSt(info, "#ffaa44")
    end
  end)
end
endSection(__sec)


-- =====================================================================
-- 13. TOOLS - EXIVA EN EL MINIMAPA
--  - Lee los mensajes de exiva ("X is very far to the north-east.")
--    y pone una bandera en el minimapa en la zona aproximada.
--  - Con varios exivas desde lugares distintos cruza las zonas
--    (triangulacion) y la marca queda mas cerca de donde esta.
--  - Funciona con exivas que lances tu a mano o con el boton/auto.
--  - Si no encuentra el minimapa, igual muestra las coordenadas.
--  Distancias de Tibia: al lado < 5 | "to the" 5-100 |
--  "far" 101-274 | "very far" 275 o mas.
-- =====================================================================
__sec = startSection("Tools")
do
  local XK = "exivaMapV1"
  local DEF = {enabled = false, name = "", auto = false, every = 5}
  if type(storage[XK]) ~= "table" then storage[XK] = {} end
  local xc = storage[XK]
  for k, v in pairs(DEF) do if xc[k] == nil then xc[k] = v end end

  local function trim(t) return (tostring(t or "")):match("^%s*(.-)%s*$") end

  g_ui.loadUIFromString([[
ExivaMapWindow < MainWindow
  !text: tr('Exiva en el minimapa')
  size: 370 360
  @onEscape: self:hide()

  Label
    id: lName
    anchors.top: parent.top
    anchors.left: parent.left
    text: Jugador:

  TextEdit
    id: name
    anchors.top: lName.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 22

  Button
    id: castBtn
    anchors.top: name.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    height: 22
    text: Exiva ahora

  CheckBox
    id: auto
    anchors.top: castBtn.bottom
    anchors.left: parent.left
    margin-top: 10
    width: 190
    text: Exiva automatico cada (seg)

  SpinBox
    id: every
    anchors.verticalCenter: auto.verticalCenter
    anchors.left: auto.right
    width: 60
    minimum: 3
    maximum: 120
    step: 1

  HorizontalSeparator
    id: sep1
    anchors.top: auto.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8

  Label
    id: result
    anchors.top: sep1.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    height: 64
    text-wrap: true
    text-auto-resize: false
    text: Sin lecturas todavia.

  Button
    id: showBtn
    anchors.top: result.bottom
    anchors.left: parent.left
    margin-top: 6
    width: 135
    height: 22
    text: Ver en minimapa

  Button
    id: clearBtn
    anchors.top: result.bottom
    anchors.right: parent.right
    margin-top: 6
    width: 135
    height: 22
    text: Borrar lecturas

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  local xUI = UIx.scriptPanel("Exiva en minimapa")
  local xWin = UI.createWindow('ExivaMapWindow', rootWidget)
  xWin:hide()

  local lastSt = ""
  local function setSt(t, c)
    if t == lastSt then return end
    lastSt = t
    UIx.setLabel(xUI.status, t, c)
    UIx.setLabel(xWin.status, t, c)
  end
  local function setResult(t) pcall(function() xWin.result:setText(t) end) end

  xWin.name:setText(xc.name or "")
  xWin.name.onTextChange = function(w, t) xc.name = trim(t) end
  xWin.auto:setChecked(xc.auto)
  xWin.auto.onCheckChange = function(w, c) xc.auto = c end
  xWin.every:setValue(xc.every or 5)
  xWin.every.onValueChange = function(w, v) xc.every = v end
  xWin.closeBtn.onClick = function() xWin:hide() end
  xUI.setupBtn.onClick = function() UIx.toggleWindow(xWin) end

  -- ----- Minimapa -----
  local mm, mmTries, mmLast = nil, 0, -1000000
  local function findMinimap()
    local found
    local function walk(w, depth)
      if found or depth > 40 then return end
      local ok, has = pcall(function() return type(w.addFlag) == "function" end)
      if ok and has then found = w; return end
      local okc, kids = pcall(function() return w:getChildren() end)
      if okc and kids then
        for _, k in ipairs(kids) do
          walk(k, depth + 1)
          if found then return end
        end
      end
    end
    pcall(function()
      local gm = modules.game_minimap
      if gm then
        if gm.getMinimapWidget then found = gm.getMinimapWidget() end
        if not found and gm.minimapWidget then found = gm.minimapWidget end
      end
    end)
    if found and type(found.addFlag) ~= "function" then found = nil end
    if not found then pcall(function() walk(g_ui.getRootWidget(), 0) end) end
    return found
  end
  local function getMinimap()
    if mm then
      local ok, dead = pcall(function() return mm:isDestroyed() end)
      if ok and not dead then return mm end
      mm = nil
    end
    if mmTries >= 10 or now - mmLast < 5000 then return nil end
    mmTries, mmLast = mmTries + 1, now
    mm = findMinimap()
    return mm
  end

  -- Una sola bandera por jugador. Se pone en el piso que este MOSTRANDO
  -- el minimapa: si subes o bajas de nivel con las flechas del minimapa
  -- (o caminando), la bandera se mueve sola a ese piso (mismo x,y).
  -- La descripcion dice en que piso esta realmente el jugador.
  local flags = {}   -- [nombre] = {pos, icon, desc, base, realPos}

  local function viewZ()
    local z
    local m = getMinimap()
    if m then
      pcall(function()
        local cp = m:getCameraPosition()
        if cp and cp.z then z = cp.z end
      end)
    end
    if not z then pcall(function() z = player:getPosition().z end) end
    return z
  end

  -- flags[nombre] = {pts = {{x, y, desc}}, realZ, z, placed = {{pos, icon, desc}}}
  local function removeFlag(name)
    local f = flags[name]
    if not f then return end
    local m = getMinimap()
    if m and m.removeFlag then
      for _, pl in ipairs(f.placed or {}) do
        pcall(function() m:removeFlag(pl.pos, pl.icon, pl.desc) end)
      end
    end
    flags[name] = nil
  end
  local function putFlags(name, pts, realZ)
    removeFlag(name)
    local m = getMinimap()
    if not m then return false end
    local z = viewZ() or realZ
    local placed, any = {}, false
    for _, pt in ipairs(pts) do
      local fp = {x = pt.x, y = pt.y, z = z}
      local d = pt.desc
      if z ~= realZ then d = d .. " [esta en z=" .. realZ .. ", viendo z=" .. z .. "]" end
      local ok = pcall(function() m:addFlag(fp, 1, d) end)
      if ok then
        any = true
        table.insert(placed, {pos = fp, icon = 1, desc = d})
      end
    end
    flags[name] = {pts = pts, realZ = realZ, z = z, placed = placed}
    return any
  end

  -- Si el minimapa cambia de piso, mover las banderas a ese piso
  macro(300, function()
    local hasFlags = false
    for _ in pairs(flags) do hasFlags = true; break end
    if not hasFlags then return end
    local z = viewZ()
    if not z then return end
    for name, f in pairs(flags) do
      if f.z ~= z then
        pcall(function() putFlags(name, f.pts, f.realZ) end)
      end
    end
  end)

  -- ----- Geometria de exiva -----
  local DIRV = {
    ["north"] = {0, -1}, ["south"] = {0, 1}, ["east"] = {1, 0}, ["west"] = {-1, 0},
    ["north-east"] = {1, -1}, ["north-west"] = {-1, -1},
    ["south-east"] = {1, 1}, ["south-west"] = {-1, 1},
  }
  local DIR_ES = {
    ["north"] = "norte", ["south"] = "sur", ["east"] = "este", ["west"] = "oeste",
    ["north-east"] = "noreste", ["north-west"] = "noroeste",
    ["south-east"] = "sureste", ["south-west"] = "suroeste",
  }
  -- {min, max, distancia para marcar si solo hay 1 lectura, texto}
  -- {min, max, distancia para marcar con 1 sola lectura, texto}
  -- (mismos limites que usa el servidor: < 5 | < 101 | < 275 | 275+)
  local RANGE = {
    near   = {0, 4, 0, "al lado (menos de 5 sqm)"},
    normal = {5, 100, 55, "cerca (5-100 sqm)"},
    far    = {101, 274, 185, "lejos (101-274 sqm)"},
    vfar   = {275, 2500, 320, "muy lejos (275+ sqm)"},
  }
  -- Igual que el servidor: |dy/dx| < 0.4142 = este/oeste,
  -- < 2.4142 = diagonal, si no = norte/sur
  local function sectorOf(dx, dy)
    if dx == 0 then return dy < 0 and "north" or "south" end
    local t = math.abs(dy / dx)
    if t < 0.4142 then return dx > 0 and "east" or "west" end
    if t < 2.4142 then
      if dx > 0 then return dy < 0 and "north-east" or "south-east" end
      return dy < 0 and "north-west" or "south-west"
    end
    return dy < 0 and "north" or "south"
  end

  local function fits(r, x, y)
    local dx, dy = x - r.from.x, y - r.from.y
    local d = math.max(math.abs(dx), math.abs(dy))
    local rg = RANGE[r.range]
    if d < rg[1] or d > rg[2] then return false end
    if r.dir and d >= 5 and sectorOf(dx, dy) ~= r.dir then return false end
    return true
  end

  local readings = {}       -- [nombre] = lista de lecturas
  local READ_TTL = 4 * 60000  -- las que ya no coinciden se descartan solas
  local MAX_READ = 8

  -- Puntos donde encajan TODAS las lecturas del grupo.
  -- Busca solo dentro del rango de la lectura mas estrecha.
  -- Promedio con PESO: los puntos mas cercanos pesan mas (1/d^2), porque
  -- "muy lejos" no tiene limite y el promedio simple se iba muy lejos.
  local function solve(set)
    local tight = set[1]
    for _, r in ipairs(set) do
      if RANGE[r.range][2] < RANGE[tight.range][2] then tight = r end
    end
    local R = RANGE[tight.range][2]
    local step = R > 1000 and 40 or (R > 300 and 12 or (R > 100 and 4 or 2))
    local cx, cy = tight.from.x, tight.from.y
    local sw, sx, sy, sxx, syy, n = 0, 0, 0, 0, 0, 0
    -- extremos de la zona vistos desde la lectura mas nueva (set[1])
    local o = set[1].from
    local nearD, farD, nearP, farP = math.huge, -1, nil, nil
    for x = cx - R, cx + R, step do
      for y = cy - R, cy + R, step do
        local ok, far = true, 0
        for _, r in ipairs(set) do
          if not fits(r, x, y) then ok = false; break end
          local d = math.max(math.abs(x - r.from.x), math.abs(y - r.from.y))
          if d > far then far = d end
        end
        if ok then
          local dl = math.max(math.abs(x - o.x), math.abs(y - o.y))
          if dl < nearD then nearD, nearP = dl, {x = x, y = y} end
          if dl > farD and dl <= 1500 then farD, farP = dl, {x = x, y = y} end
          local w = 1 / (far * far + 1)
          sw, sx, sy = sw + w, sx + w * x, sy + w * y
          sxx, syy = sxx + w * x * x, syy + w * y * y
          n = n + 1
        end
      end
    end
    if n == 0 then return nil end
    local mx, my = sx / sw, sy / sw
    local var = (sxx / sw - mx * mx) + (syy / sw - my * my)
    local err = math.floor(math.sqrt(math.max(0, var)) + step)
    return {x = math.floor(mx + 0.5), y = math.floor(my + 0.5)}, err,
           {near = nearP, far = farP, nearD = nearD, farD = farD}
  end

  -- Usa la lectura mas nueva y le suma las anteriores que coincidan
  -- (si el jugador se movio, las que ya no coinciden se descartan).
  local function estimate(name)
    local list = readings[name]
    if not list or #list == 0 then return nil end
    local last = list[#list]
    local set = {last}
    local best, err, zone = nil, nil, nil
    for i = #list - 1, 1, -1 do
      local r = list[i]
      -- lecturas desde el mismo sqm no aportan nada nuevo
      local same = false
      for _, u in ipairs(set) do
        if u.from.x == r.from.x and u.from.y == r.from.y then same = true; break end
      end
      if not same then
        local try = {}
        for _, u in ipairs(set) do table.insert(try, u) end
        table.insert(try, r)
        local p2, e2, z2 = solve(try)
        if p2 then set, best, err, zone = try, p2, e2, z2 end
      end
    end

    if #set == 1 then
      -- Una sola lectura: punto en la direccion a la distancia tipica
      if last.range == "near" or not last.dir then
        return {x = last.from.x, y = last.from.y, z = last.z}, 1, 4
      end
      local v = DIRV[last.dir] or {0, 0}
      local d = RANGE[last.range][3]
      local rg = RANGE[last.range]
      return {x = last.from.x + v[1] * d, y = last.from.y + v[2] * d, z = last.z},
             1, (last.range == "vfar") and nil or math.floor((rg[2] - rg[1]) / 2)
    end
    best.z = last.z
    return best, #set, err, zone
  end

  local lastFound = nil
  local function addReading(name, range, dir, dz)
    local me = player:getPosition()
    if not me then return end
    readings[name] = readings[name] or {}
    local list = readings[name]
    for i = #list, 1, -1 do
      if now - list[i].at > READ_TTL then table.remove(list, i) end
    end
    table.insert(list, {from = {x = me.x, y = me.y}, z = me.z + (dz or 0),
                        range = range, dir = dir, at = now})
    while #list > MAX_READ do table.remove(list, 1) end

    local p, nUsed, err, zone = estimate(name)
    if not p then return end
    local where = RANGE[range][4]
    if dir then where = where .. " al " .. (DIR_ES[dir] or dir) end
    if dz == -1 then where = where .. ", piso ARRIBA" end
    if dz == 1 then where = where .. ", piso ABAJO" end

    local last = list[#list]
    local line = (nUsed == 1 and last.range == "vfar" and last.dir)
    local prec = err and ("+/- " .. err .. " sqm") or "solo direccion"
    local pts
    if line then
      -- "Muy lejos" no dice cuanto: se marca una LINEA de banderas en esa
      -- direccion. Donde se crucen las lineas de 2 exivas, ahi esta.
      local v = DIRV[last.dir] or {0, 0}
      pts = {}
      for _, d in ipairs({300, 450, 650, 900, 1200}) do
        table.insert(pts, {x = last.from.x + v[1] * d, y = last.from.y + v[2] * d,
          desc = name .. ": ~" .. d .. " sqm al " .. (DIR_ES[last.dir] or last.dir)})
      end
    else
      pts = {{x = p.x, y = p.y, desc = name .. ": " .. where .. " (" .. prec .. ")"}}
      -- Zona grande: marcar tambien donde empieza y termina, para que
      -- veas el tramo donde puede estar (el jugador esta ENTRE esas marcas)
      if zone and err and err > 40 then
        if zone.near then
          table.insert(pts, {x = zone.near.x, y = zone.near.y,
            desc = name .. ": zona desde aqui (lo mas cerca posible)"})
        end
        if zone.far then
          table.insert(pts, {x = zone.far.x, y = zone.far.y,
            desc = name .. ": zona hasta aqui (lo mas lejos posible)"})
        end
      end
    end
    lastFound = {x = pts[1].x, y = pts[1].y, z = p.z}
    local okf, marked = pcall(putFlags, name, pts, p.z)
    marked = okf and marked

    local tip
    if line then
      tip = "Camina HACIA esa direccion con el exiva automatico: cuando cambie a 'lejos' la marca queda a ~50 sqm"
    elseif last.range == "vfar" then
      tip = "Sigue caminando hacia alla: al pasar a 'lejos' se vuelve precisa"
    elseif nUsed == 1 then
      tip = "Camina 30-50 sqm de lado y haz otro exiva"
    elseif err and err > 25 then
      tip = "Acercate y haz otro exiva para afinar"
    else
      tip = "Ubicacion bastante precisa"
    end
    local posTxt = line and ("Direccion: " .. (DIR_ES[last.dir] or last.dir) .. " (sin distancia)")
      or ("Aprox: " .. p.x .. ", " .. p.y .. ", " .. p.z .. "  (" .. prec .. ")")
    setResult(name .. ": " .. where
      .. "\n" .. posTxt
      .. "\nLecturas usadas: " .. nUsed .. " de " .. #list
      .. "\n" .. tip)
    if marked then
      setSt("Marcado en minimapa: " .. name, "#66ff66")
    else
      setSt("Sin minimapa: mira las coordenadas", "#ffaa44")
    end
  end

  xWin.showBtn.onClick = function()
    local m = getMinimap()
    if not (m and lastFound) then
      setSt(lastFound and "No encuentro el minimapa" or "Aun no hay lecturas", "#ffaa44")
      return
    end
    pcall(function()
      local z = viewZ() or player:getPosition().z
      m:setCameraPosition({x = lastFound.x, y = lastFound.y, z = z})
    end)
  end
  xWin.clearBtn.onClick = function()
    for n in pairs(flags) do removeFlag(n) end
    readings, lastFound = {}, nil
    setResult("Sin lecturas todavia.")
    setSt("Lecturas borradas", "#aaaaaa")
  end

  -- ----- Leer mensajes de exiva -----
  -- Lee si el script esta activo, o si acabas de usar "Exiva ahora"
  local lastCast = -1000000
  onTextMessage(function(mode, text)
    if not xc.enabled and now - lastCast > 4000 then return end
    local name, rest = tostring(text or ""):match("^(.-) is (.-)%.?$")
    if not name or name == "" or #name > 40 then return end
    rest = rest:lower()
    local dir
    if rest == "standing next to you" then
      addReading(name, "near", nil, 0)
    elseif rest == "above you" then
      addReading(name, "near", nil, -1)
    elseif rest == "below you" then
      addReading(name, "near", nil, 1)
    else
      dir = rest:match("^very far to the (.+)$")
      if dir and DIRV[dir] then return addReading(name, "vfar", dir, 0) end
      dir = rest:match("^far to the (.+)$")
      if dir and DIRV[dir] then return addReading(name, "far", dir, 0) end
      dir = rest:match("^on a higher level to the (.+)$")
      if dir and DIRV[dir] then return addReading(name, "normal", dir, -1) end
      dir = rest:match("^on a lower level to the (.+)$")
      if dir and DIRV[dir] then return addReading(name, "normal", dir, 1) end
      dir = rest:match("^to the (.+)$")
      if dir and DIRV[dir] then return addReading(name, "normal", dir, 0) end
    end
  end)

  -- ----- Lanzar exiva -----
  local function castExiva(manual)
    -- Leer el nombre directo de la casilla (por si no se guardo)
    local n = ""
    pcall(function() n = trim(xWin.name:getText()) end)
    if n == "" then n = trim(xc.name) end
    if n == "" then setSt("Escribe el nombre del jugador", "#ffaa44"); return end
    xc.name = n
    -- El automatico respeta el exhaust de soporte; el boton lanza siempre
    if not manual and not Shared.supportReady() then return end
    local words = 'exiva "' .. n .. '"'
    local ok = pcall(function() say(words) end)
    if not ok then ok = pcall(function() g_game.talk(words) end) end
    lastCast = now
    Shared.lastSupport = now
    setSt(ok and ("Lanzado: " .. words) or "No se pudo lanzar el exiva",
          ok and "#88ccff" or "#ff6666")
  end
  xWin.castBtn.onClick = function() castExiva(true) end

  UIx.bindSwitch(xc, xUI.switch, xWin.enableBtn, function(v)
    setSt(v and "Activo" or "Inactivo", v and "#66ff66" or "#888888")
  end)

  macro(500, function()
    if not xc.enabled or not xc.auto or not g_game.isOnline() then return end
    if now - lastCast < (xc.every or 5) * 1000 then return end
    castExiva(false)
  end)
end
endSection(__sec)

-- =====================================================================
-- 14. TOOLS - EXANI HUR (levitar arriba / abajo)
--  - Boton "Levitar" en la pestana: mira el sqm de enfrente y elige
--    solo si es "exani hur up" o "exani hur down".
--  - Modo automatico (interruptor): al chocar UNA vez contra una pared
--    (teclado o keypad del celular), levita solo. Solo lo lanza si el
--    sqm de enfrente permite levitar (arriba o abajo); si no, no gasta
--    mana. El cliente no avisa del choque al servidor, por eso se revisa
--    el paso antes de que el cliente lo cancele.
--  - Boton manual: si no puede saber si es arriba o abajo, prueba
--    primero arriba y la siguiente vez abajo.
--  - Sin "exhausted" con utani tempo hur / utito tempo: si el exhaust de
--    soporte esta activo, el levitar queda EN COLA, aparta el turno
--    (Auto Haste, Buff, Exiva y Boost esperan) y se lanza apenas se
--    pueda (hasta 3 s). Si aun asi sale "exhausted", reintenta 1 vez.
--  - Solo funciona mirando al norte, sur, este u oeste (no diagonal).
-- =====================================================================
__sec = startSection("Tools")
do
  local LK = "exaniHurV1"
  local DEF = {enabled = false, minMana = 50, tryFirst = "down"}
  if type(storage[LK]) ~= "table" then storage[LK] = {} end
  local lc = storage[LK]
  for k, v in pairs(DEF) do if lc[k] == nil then lc[k] = v end end

  g_ui.loadUIFromString([[
ExaniHurWindow < MainWindow
  !text: tr('Exani Hur')
  size: 360 270
  @onEscape: self:hide()

  Button
    id: autoBtn
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    height: 26
    text: Levitar (elige arriba o abajo)

  Button
    id: upBtn
    anchors.top: autoBtn.bottom
    anchors.left: parent.left
    margin-top: 6
    width: 130
    height: 24
    text: Levitar ARRIBA

  Button
    id: downBtn
    anchors.top: autoBtn.bottom
    anchors.right: parent.right
    margin-top: 6
    width: 130
    height: 24
    text: Levitar ABAJO

  Label
    id: lMana
    anchors.top: upBtn.bottom
    anchors.left: parent.left
    margin-top: 14
    width: 180
    text: Mana minima para lanzarlo

  SpinBox
    id: minMana
    anchors.verticalCenter: lMana.verticalCenter
    anchors.left: lMana.right
    width: 65
    minimum: 0
    maximum: 99999
    step: 10

  VbHint
    id: hint
    anchors.top: lMana.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Activar = modo automatico: al chocar una vez contra una pared donde se puede levitar, levita solo. Solo norte, sur, este u oeste.

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar

ExaniHurQuick < Panel
  height: 26

  Button
    id: lev
    anchors.fill: parent
    text: Levitar (exani hur)
]])

  UIx.header("EXANI HUR")
  local hUI = UIx.scriptPanel("Exani Hur auto")
  local quick = setupUI("ExaniHurQuick")
  local hWin = UI.createWindow('ExaniHurWindow', rootWidget)
  hWin:hide()

  local lastSt = ""
  local function setSt(t, c)
    if t == lastSt then return end
    lastSt = t
    UIx.setLabel(hUI.status, t, c)
    UIx.setLabel(hWin.status, t, c)
  end

  hWin.minMana:setValue(lc.minMana or 50)
  hWin.minMana.onValueChange = function(w, v) lc.minMana = v end
  hWin.closeBtn.onClick = function() hWin:hide() end
  hUI.setupBtn.onClick = function() UIx.toggleWindow(hWin) end

  -- ----- Mapa: que hay enfrente -----
  -- Direcciones de Tibia: 0 norte, 1 este, 2 sur, 3 oeste
  local DV = {[0] = {0, -1}, [1] = {1, 0}, [2] = {0, 1}, [3] = {-1, 0}}
  local DNAME = {[0] = "norte", [1] = "este", [2] = "sur", [3] = "oeste"}

  local function facing()
    local ok, d = pcall(function() return player:getDirection() end)
    if ok and DV[d] then return d end
    return nil
  end

  local function tileInfo(p)
    -- devuelve: conocido, tiene suelo, se puede caminar
    local tile
    pcall(function() tile = g_map.getTile(p) end)
    if not tile then return false, false, false end
    local okg, ground = pcall(function() return tile:getGround() end)
    local okw, walk = pcall(function() return tile:isWalkable() end)
    return true, (okg and ground ~= nil), (okw and walk == true)
  end

  -- "up", "down" o nil (no se puede saber)
  local function decide(dirOverride)
    local d = dirOverride or facing()
    if not d or not DV[d] then return nil, nil end
    local me = pos()
    local v = DV[d]
    local fx, fy = me.x + v[1], me.y + v[2]

    -- Arriba: enfrente en el piso de arriba se puede pisar y no hay
    -- techo justo encima de ti
    local kUp, gUp, wUp = tileInfo({x = fx, y = fy, z = me.z - 1})
    local kRoof, gRoof = tileInfo({x = me.x, y = me.y, z = me.z - 1})
    if kUp and gUp and wUp and not (kRoof and gRoof) then return "up", d end

    -- Abajo: enfrente no hay suelo en este piso y abajo se puede pisar
    local kF, gF = tileInfo({x = fx, y = fy, z = me.z})
    local kDn, gDn, wDn = tileInfo({x = fx, y = fy, z = me.z + 1})
    if (not kF or not gF) and kDn and gDn and wDn then return "down", d end

    return nil, d
  end

  -- ----- Lanzar (con cola para no chocar con haste / utito) -----
  local lastCast, lastGuess, castAt = -1000000, nil, -1000000
  local queued = nil          -- {which, untilT, retried}
  local QUEUE_MS = 3000

  local function doCast(which)
    local words = "exani hur " .. which
    local ok = pcall(function() say(words) end)
    if not ok then pcall(function() g_game.talk(words) end) end
    lastCast, castAt = now, now
    Shared.lastSupport = now
    Shared.supportReserve = 0
    setSt("Lanzado: " .. words, "#88ccff")
  end

  local function cast(which, manual, retried)
    if (lc.minMana or 0) > 0 and mana() < lc.minMana then
      setSt("Falta mana (" .. lc.minMana .. ")", "#ffaa44")
      return false
    end
    if Shared.supportReady(true) then
      doCast(which)
      queued = {which = which, sentAt = now, retried = retried}
      return true
    end
    -- Exhaust de soporte activo: a la cola y apartar el turno
    queued = {which = which, untilT = now + QUEUE_MS, retried = retried, waiting = true}
    Shared.supportReserve = now + QUEUE_MS
    setSt("En cola: exani hur " .. which .. " (esperando exhaust)", "#ffcc66")
    return true
  end

  -- Lanza lo que este en cola apenas pase el exhaust
  macro(50, function()
    if not queued or not queued.waiting then return end
    if now > queued.untilT then
      queued = nil
      Shared.supportReserve = 0
      setSt("Cola vencida: no se lanzo", "#ffaa44")
      return
    end
    if Shared.supportReady(true) then
      local w, r = queued.which, queued.retried
      doCast(w)
      queued = {which = w, sentAt = now, retried = r}
    end
  end)

  -- Si sale "exhausted" justo despues de lanzarlo: reintentar 1 vez
  onTextMessage(function(mode, text)
    if not queued or queued.waiting or not queued.sentAt then return end
    if now - queued.sentAt > 1200 then queued = nil; return end
    local t = (text or ""):lower()
    if t:find("exhausted", 1, true) and not queued.retried then
      -- exhaust: el lado estaba bien, reintentar el MISMO despues
      local w = queued.which
      Shared.supportBlock = now + 1000
      lastBumpTry = now - 1000   -- permitir reintento pronto
      cast(w, true, true)
    elseif (t:find("not possible", 1, true) or t:find("not enough room", 1, true)) then
      -- ese lado NO es: la proxima vez probar el otro
      lc.tryFirst = (queued.which == "down") and "up" or "down"
      lastBumpTry = now - 1200   -- reintentar casi de inmediato con el otro
      queued = nil
    end
  end)

  -- Elige solo. Si no sabe, alterna: primero arriba, luego abajo.
  local function levitate(manual, dir)
    local which, d = decide(dir)
    if not d then
      setSt("Mira al norte, sur, este u oeste", "#ffaa44")
      return
    end
    if not which and not manual then
      setSt("Aqui no se puede levitar", "#aaaaaa")
      return
    end
    if not which then
      which = (lastGuess == "up") and "down" or "up"
      lastGuess = which
    else
      lastGuess = nil
    end
    cast(which, manual)
  end

  quick.lev.onClick = function() levitate(true) end
  hWin.autoBtn.onClick = function() levitate(true) end
  hWin.upBtn.onClick = function() cast("up", true) end
  hWin.downBtn.onClick = function() cast("down", true) end

  UIx.bindSwitch(lc, hUI.switch, hWin.enableBtn, function(v)
    setSt(v and "Activo - choca contra la pared" or "Inactivo", v and "#66ff66" or "#888888")
  end)

  -- ----- Modo automatico: detectar choque contra la pared -----
  -- No se intercepta la funcion de caminar (el keypad/joystick del celular
  -- no siempre pasa por ahi). Un macro revisa: si estas QUIETO, mirando
  -- hacia una pared y tu posicion no cambia, es un choque -> levita.
  -- IDs de puertas (si topas con una, se ABRE en vez de levitar)
  local DOOR_IDS = {5007,8265,31570,1629,1632,5129,6252,6249,7715,7712,7714,7719,
    6256,1669,1672,5125,5115,5124,17701,17710,1642,6260,5107,4912,6251,5291,1683,
    1696,1692,5006,2179,5116,11705,30772,30774,6248,5735,5732,5120,23873,5736,6264,
    5122,30049,30042,7727,5293,9567,34847,1764,21051,30823,5282,20453,2772,27260,
    2773,5281,1968,31116,31120,30742,31115,31118,20474,5733,31202,31228,31199,31200,
    33262,30824,5126,8257,8258,8255,8256,30777,30776,23877,31130,25803,16277,5098,
    5104,5102,5106,5109,5111,5113,5118,5100,1638,1640,19250,3500,3497,3498,3499,2177,
    17709,23875,1644,5131,28546,6254,1646,1648,4997,8259,8363,5097,1631,1628,20446,
    20443,20444,1687,1698}
  local DOOR_SET = {}
  for _, id in ipairs(DOOR_IDS) do DOOR_SET[id] = true end

  -- Mira el sqm de enfrente: devuelve "door"+thing, "wall", o nil (libre)
  -- Mira el sqm de enfrente:
  --  "door" -> puerta (abrir)
  --  "edge" -> orilla/borde sin suelo (lava, vacio): aqui se BAJA -> down
  --  "wall" -> pared solida con suelo: aqui se SUBE -> up
  --  nil    -> libre o criatura
  local function ahead(dir)
    if not DV[dir] then return nil end
    local me = pos()
    local v = DV[dir]
    local tile
    pcall(function() tile = g_map.getTile({x = me.x + v[1], y = me.y + v[2], z = me.z}) end)

    -- sin tile o sin suelo enfrente = ORILLA (borde) -> bajar
    if not tile then return "edge" end
    local hasGround = false
    pcall(function() hasGround = (tile:getGround() ~= nil) end)
    if not hasGround then return "edge" end

    local okw, walk = pcall(function() return tile:isWalkable() end)
    if okw and walk then return nil end
    local okc, crs = pcall(function() return tile:getCreatures() end)
    if okc and crs and #crs > 0 then return nil end

    local things = {}
    pcall(function() local x=tile:getTopUseThing(); if x then table.insert(things,x) end end)
    pcall(function() for _,it in ipairs(tile:getItems() or {}) do table.insert(things,it) end end)
    for _, thing in ipairs(things) do
      local id; pcall(function() id = thing:getId() end)
      if id and DOOR_SET[id] then return "door", thing end
    end
    return "wall"    -- bloqueado con suelo = pared -> subir
  end

  local lastPos, lastMove, lastBumpTry, lastDoorTry = nil, 0, -1000000, -1000000
  macro(100, function()
    if not lc.enabled or not g_game.isOnline() then return end
    local me = pos()
    if not lastPos or me.x ~= lastPos.x or me.y ~= lastPos.y or me.z ~= lastPos.z then
      lastPos = {x = me.x, y = me.y, z = me.z}
      lastMove = now
      return
    end
    local okw, walking = pcall(function() return player:isWalking() end)
    if okw and walking then lastMove = now; return end
    if now - lastMove < 150 then return end
    local d = facing()
    if not d then return end

    local kind, thing = ahead(d)
    if kind == "door" then
      -- PUERTA: abrirla, no levitar
      if now - lastDoorTry >= 600 then
        lastDoorTry = now
        pcall(function() g_game.use(thing) end)
      end
      return
    end
    if kind ~= "wall" and kind ~= "edge" then return end   -- libre: nada
    if now - lastBumpTry < 1500 then return end
    lastBumpTry = now
    -- ORILLA/borde (lava, vacio) = bajar ; PARED solida = subir
    local which = (kind == "edge") and "down" or "up"
    cast(which, false)
  end)
end
endSection(__sec)

-- =====================================================================
-- =====================================================================
-- 15. TOOLS - AUTO FOLLOW MC (sigue por gradas, escaleras, rope, puertas)
--  Motor de seguimiento por pisos adaptado. Recuerda la ultima posicion
--  del compañero en tu piso; al cambiar de nivel camina ahi y USA lo que
--  haya (escalera, rope, pala, grada, puerta). No lee mapas de otros
--  pisos (ligero).
--  - Cola de nombres: sigue al primero disponible; si lo matan/pierde,
--    pasa al siguiente.
--  - Lo usa tambien el War Chase (modo CON PISOS) para el enemigo.
-- =====================================================================
__sec = startSection("Tools")
do
  local FK = "autoFollowV2"
  if type(storage[FK]) ~= "table" then
    storage[FK] = {enabled = false, names = "", priority = true, pausePk = false}
  end
  local fc = storage[FK]
  if fc.priority == nil then fc.priority = true end

  local function trim(t) return (tostring(t or "")):match("^%s*(.-)%s*$") end
  local function low(s) return trim(s):lower() end
  local function dist(a, b)
    if not a or not b then return 999 end
    return math.max(math.abs(a.x-b.x), math.abs(a.y-b.y))
  end
  local function key(p) return p and (p.x..":"..p.y..":"..p.z) or "" end
  local function copyPos(p) return p and {x=p.x, y=p.y, z=p.z} or nil end
  local function myPos() return pos() end
  local function myZ() local p=pos(); return p and p.z end

  -- ====== MOTOR DE FOLLOW (compartido con War Chase) ======
  -- Sigue a UNA criatura (la que se le pase). Guarda posiciones por piso.
  local FollowEngine = {}
  do
    local followPos = {}          -- [z] = ultima pos vista en ese piso
    local lastPos = nil
    local lastTransition = nil
    local prevSeenPos = nil        -- ultima pos vista del target (cualquier piso)
    local lastUseAt, lastWalkAt, lastProgressAt = 0, 0, 0
    local lastPKey = ""
    local ROPE, SHOVEL = 3003, 3457

    local function remember(p)
      if p then local c=copyPos(p); followPos[p.z]=c; lastPos=c end
    end

    local function following()
      local c; pcall(function() c = g_game.getFollowingCreature() end); return c
    end
    local function doFollow(cr)
      pcall(function() g_game.follow(cr) end)
    end
    local function cancel()
      if following() then pcall(function() g_game.cancelFollow() end) end
    end

    local function tryUse(thing)
      if not thing then return false end
      local ok = pcall(function() g_game.use(thing) end)
      return ok
    end
    local function tryTool(id, thing)
      if not id or not thing then return false end
      local it = findItem(id)
      if it then return pcall(function() useWith(it, thing) end) end
      return pcall(function() g_game.useInventoryItemWith(id, thing, 0) end)
    end

    -- IDs (tomados del Sabuezo) para reconocer que accion hacer en el sqm
    local USE_IDS = {34847,1764,21051,30823,6264,5282,20453,20454,20474,11708,11705,
      6257,6256,2772,27260,2773,1632,1633,1948,435,6252,6253,5007,4911,1629,1630,
      5108,5107,5281,1968,5542,31116,31120,30742,31115,31118,5737,5736,5734,5733,
      31202,31228,31199,31200,33262,30824,5125,5126,5116,5117,8257,8258,8255,8256,
      5120,30777,30776,23873,23877,31262,31130,31129,6250,6249,5122,30049,7131,7132,7727}
    local SHOVEL_IDS = {606,593,867,608,3457}
    local ROPE_IDS = {17238,12202,12935,386,421,21966,14238,3003}
    local DOOR_IDS = {5007,8265,31570,1629,1632,5129,6252,6249,7715,7712,7714,7719,
      6256,1669,1672,5125,5115,5124,17701,17710,1642,6260,5107,4912,6251,5291,1683,
      1696,1692,5006,2179,5116,11705,30772,30774,6248,5735,5732,5120,23873,5736,6264,
      5122,30049,30042,7727,5293,9567,34847,1764,21051,30823,5282,20453,2772,27260,
      2773,5281,1968,31116,31120,30742,31115,31118,20474,5733,31202,31228,31199,31200,
      33262,30824,5126,8257,8258,8255,8256,30777,30776,23877,31130,25803,16277,5098,
      5104,5102,5106,5109,5111,5113,5118,5100,1638,1640,19250,3500,3497,3498,3499,2177,
      17709,23875,1644,5131,28546,6254,1646,1648,4997,8259,8363,5097,1631,1628,20446,
      20443,20444,1687,1698}
    local function inList(list, id) for _,v in ipairs(list) do if v==id then return true end end return false end
    local SHOVEL, ROPE = 3457, 3003

    -- usar lo que haya en el sqm de destino y alrededores (1 sqm)
    -- Reconoce por ID: escaleras/aberturas (USE), huecos de pala (SHOVEL),
    -- rope spots (ROPE). Si no matchea, prueba usar el objeto igual.
    local function useTransition(dpos, force)
      if not dpos then return false end
      local me = myPos()
      if dist(me, dpos) > 2 then return false end
      local t = now
      if not force and t - lastUseAt < 350 then return false end
      lastUseAt = t

      -- sqm de destino primero, luego alrededores
      local spots = {dpos}
      for dx=-1,1 do for dy=-1,1 do
        table.insert(spots, {x=dpos.x+dx, y=dpos.y+dy, z=dpos.z})
      end end

      for _, sp in ipairs(spots) do
        if sp.z == myZ() then
          local tile
          pcall(function() tile = g_map.getTile(sp) end)
          if tile then
            -- juntar todas las cosas del sqm
            local things = {}
            pcall(function() local x=tile:getTopUseThing(); if x then table.insert(things,x) end end)
            pcall(function() local x=tile:getTopThing(); if x then table.insert(things,x) end end)
            pcall(function() local x=tile:getGround(); if x then table.insert(things,x) end end)
            pcall(function()
              for _, it in ipairs(tile:getItems() or {}) do table.insert(things, it) end
            end)
            for _, thing in ipairs(things) do
              local id
              pcall(function() id = thing:getId() end)
              if id then
                if inList(DOOR_IDS, id) then
                  if tryUse(thing) then return true end
                elseif inList(ROPE_IDS, id) then
                  if tryTool(ROPE, thing) then return true end
                elseif inList(SHOVEL_IDS, id) then
                  if tryTool(SHOVEL, thing) then return true end
                elseif inList(USE_IDS, id) then
                  if tryUse(thing) then return true end
                end
              end
            end
            -- respaldo: usar lo que haya (escalera/agujero no listado)
            for _, thing in ipairs(things) do
              if tryUse(thing) then return true end
            end
          end
        end
      end
      return false
    end

    -- dar un paso hacia dpos (1 sqm) sin pathfinder
    local function stepInto(dpos)
      local me = myPos()
      local d = dist(me, dpos)
      if d ~= 1 then return false end
      local dx = (dpos.x>me.x) and 1 or (dpos.x<me.x) and -1 or 0
      local dy = (dpos.y>me.y) and 1 or (dpos.y<me.y) and -1 or 0
      local dir
      if dx==0 and dy==-1 then dir=0 elseif dx==1 and dy==0 then dir=1
      elseif dx==0 and dy==1 then dir=2 elseif dx==-1 and dy==0 then dir=3
      elseif dx==1 and dy==-1 then dir=4 elseif dx==1 and dy==1 then dir=5
      elseif dx==-1 and dy==1 then dir=6 elseif dx==-1 and dy==-1 then dir=7 end
      if dir==nil then return false end
      lastWalkAt = now
      return pcall(function() g_game.walk(dir, false) end)
    end

    -- caminar hacia dpos (mismo piso). Prueba varios metodos, igual que
    -- el script Sabuezo, para funcionar con o sin cavebot cargado.
    local lastPath = -100000
    local function walkTo(dpos, precision)
      if not dpos or dpos.z ~= myZ() then return false end
      precision = precision or 0
      if player:isWalking() and now - lastWalkAt < 500 then return true end
      -- 1) CaveBot.walkTo (si hay cavebot)
      if CaveBot and CaveBot.walkTo then
        local ok, w = pcall(function()
          return CaveBot.walkTo(dpos, 50, {ignoreNonPathable=true, precision=precision,
            ignoreStairs=false, allowUnseen=true, allowOnlyVisibleTiles=false})
        end)
        if ok and w then lastWalkAt=now; return true end
      end
      -- 2) autoWalk global (lo usa el Sabuezo)
      if type(autoWalk) == "function" then
        local ok = pcall(function()
          autoWalk(dpos, 50, {ignoreNonPathable=true, precision=precision, ignoreStairs=false})
        end)
        if ok then lastWalkAt=now; return true end
      end
      -- 3) player:autoWalk (nativo del cliente)
      if player and player.autoWalk then
        local ok = pcall(function() player:autoWalk(dpos) end)
        if ok then lastWalkAt=now; return true end
      end
      -- 4) findPath (cada 400ms) + paso directo
      local me = myPos()
      if now - lastPath >= 400 then
        lastPath = now
        local ok, path = pcall(function()
          return findPath(me, dpos, 30, {ignoreNonPathable=true, precision=precision})
        end)
        if ok and path and #path>0 then
          pcall(function() if walk then walk(path[1]) else g_game.walk(path[1], false) end end)
          lastWalkAt=now; return true
        end
      end
      local dx=(dpos.x>me.x) and 1 or (dpos.x<me.x) and -1 or 0
      local dy=(dpos.y>me.y) and 1 or (dpos.y<me.y) and -1 or 0
      if dx~=0 or dy~=0 then
        pcall(function() if walk then walk({x=me.x+dx,y=me.y+dy,z=me.z}) end end)
        lastWalkAt=now
      end
      return true
    end

    -- abrir una puerta cerrada en el sqm hacia donde vamos
    local lastDoorAt = 0
    local DOOR_COOLDOWN = 200
    local DOOR_SET = {}
    for _, id in ipairs(DOOR_IDS) do DOOR_SET[id] = true end
    local function openDoorToward(dest)
      if now - lastDoorAt < DOOR_COOLDOWN then return end
      local me = myPos()
      if not me or not dest then return end
      local dx = (dest.x>me.x) and 1 or (dest.x<me.x) and -1 or 0
      local dy = (dest.y>me.y) and 1 or (dest.y<me.y) and -1 or 0
      if dx==0 and dy==0 then return end
      local sp = {x=me.x+dx, y=me.y+dy, z=me.z}
      local tile
      pcall(function() tile = g_map.getTile(sp) end)
      if not tile then return end
      -- si no se puede caminar ahi y hay una puerta, abrirla
      local walkable = true
      pcall(function() walkable = tile:isWalkable() end)
      if walkable then return end
      local things = {}
      pcall(function() local x=tile:getTopUseThing(); if x then table.insert(things,x) end end)
      pcall(function() for _,it in ipairs(tile:getItems() or {}) do table.insert(things,it) end end)
      for _, thing in ipairs(things) do
        local id; pcall(function() id = thing:getId() end)
        if id and DOOR_SET[id] then
          pcall(function() g_game.use(thing) end)
          lastDoorAt = now
          return
        end
      end
    end

    -- API publica
    function FollowEngine.remember(p) remember(p) end
    function FollowEngine.reset()
      followPos, lastPos, lastTransition = {}, nil, nil
      cancel()
    end
    function FollowEngine.onMove(creature, oldPos, newPos)
      oldPos = oldPos or prevSeenPos
      if oldPos then remember(oldPos) end
      if newPos then remember(newPos) end
      if oldPos and newPos and oldPos.z ~= newPos.z then
        local pz = myZ()
        -- guardar en NUESTRO piso el sqm por donde cambio (la escalera/hueco)
        if oldPos.z == pz then lastTransition = copyPos(oldPos); followPos[pz]=lastTransition
        elseif newPos.z == pz then lastTransition = copyPos(newPos); followPos[pz]=lastTransition
        else
          -- cambio entre dos pisos que no son el nuestro: usar oldPos como pista
          lastTransition = copyPos(oldPos); followPos[oldPos.z]=copyPos(oldPos)
        end
      end
    end
    -- seguir a 'target' (criatura) este tick
    function FollowEngine.chase(target)
      local me = myPos()
      local pk = key(me)
      if pk ~= "" and pk ~= lastPKey then lastPKey=pk; lastProgressAt=now end

      -- si lo vemos: recordar SIEMPRE su posicion (sirve para la transicion)
      if target then
        local tp = copyPos(target:getPosition())
        remember(tp)
        prevSeenPos = tp
        if tp and tp.z == myZ() then
          local f = following()
          if not f or f:getId() ~= target:getId() then doFollow(target) end
          return "same"
        end
      end

      -- no esta en nuestro piso (o no se ve): ir a la ultima pos conocida de
      -- ESTE piso y usar la escalera/alcantarilla/rope de ahi.
      local z = myZ()
      local lp = nil
      if lastTransition and lastTransition.z == z then lp = lastTransition end
      if not lp and z and followPos[z] then lp = followPos[z] end
      if not lp and lastPos and lastPos.z == z then lp = lastPos end
      if not lp then return "lost" end

      local d = dist(me, lp)
      -- si ya estas sobre o junto al sqm donde subio: USA la escalera/grada YA
      if d <= 1 then
        -- grada: pisar (stepInto) ; escalera/rope/agujero: usar
        if d == 0 then
          useTransition(lp, true)          -- estas encima: usa lo que haya
        else
          -- a 1 sqm: primero intenta pisar (grada), luego usar
          if not stepInto(lp) then useTransition(lp) end
          useTransition(lp)                -- por si es escalera adyacente
        end
        return "floor"
      end
      -- aun lejos: abrir puerta en el camino si la hay, y caminar
      openDoorToward(lp)
      local walking = walkTo(lp, 0)
      if not walking then walkTo(lp, 1) end
      if d <= 2 then useTransition(lp) end
      return "floor"
    end
    function FollowEngine.stop() cancel() end
  end
  Shared.FollowEngine = FollowEngine

  -- evento de movimiento de criaturas (vBot lo provee)
  pcall(function()
    if onCreaturePositionChange then
      onCreaturePositionChange(function(cr, newPos, oldPos)
        if Shared.followTarget and cr and cr.getId and Shared.followTarget.getId
           and cr:getId() == Shared.followTarget:getId() then
          FollowEngine.onMove(cr, oldPos, newPos)
          -- reintentar el follow justo tras un cambio de piso (como Sabuezo)
          if oldPos and newPos and oldPos.z ~= newPos.z and type(schedule) == "function" then
            local function kick()
              if Shared.followTarget then FollowEngine.chase(Shared.followTarget) end
            end
            schedule(80, kick); schedule(220, kick); schedule(500, kick); schedule(900, kick)
          end
        end
      end)
    end
  end)
  -- cuando TU cambias de piso: cancelar follow viejo y reenganchar
  pcall(function()
    if onPlayerPositionChange then
      onPlayerPositionChange(function(newPos, oldPos)
        if not oldPos or not newPos or oldPos.z == newPos.z then return end
        if not Shared.followTarget then return end
        pcall(function() if g_game.getFollowingCreature() then g_game.cancelFollow() end end)
        if type(schedule) == "function" then
          local function kick()
            if Shared.followTarget then FollowEngine.chase(Shared.followTarget) end
          end
          schedule(120, kick); schedule(350, kick); schedule(650, kick)
        end
      end)
    end
  end)

  -- ====== UI del Auto Follow MC ======
  g_ui.loadUIFromString([[
AutoFollowWindow < MainWindow
  !text: tr('Auto Follow MC')
  size: 380 260
  @onEscape: self:hide()

  Label
    id: lNames
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    text: Nombres a seguir (coma, en orden de prioridad):

  TextEdit
    id: names
    anchors.top: lNames.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 4
    height: 22

  CheckBox
    id: priority
    anchors.top: names.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 10
    text: Volver al #1 cuando reaparezca (si no, se queda con el actual)

  CheckBox
    id: pausePk
    anchors.top: priority.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 6
    text: Pausar si hay un PK en pantalla

  VbHint
    id: hint
    anchors.top: pausePk.bottom
    anchors.left: parent.left
    anchors.right: parent.right
    margin-top: 8
    text: Sigue por gradas, escaleras, rope, pala y puertas usando la ultima posicion vista. Necesita pala/cuerda en mochila para esos casos.

  VbStatus
    id: status
    anchors.left: parent.left
    anchors.right: parent.right
    anchors.bottom: enableBtn.top
    margin-bottom: 6
    text: Inactivo

  Button
    id: enableBtn
    anchors.bottom: parent.bottom
    anchors.left: parent.left
    width: 90
    text: Activar

  Button
    id: closeBtn
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    width: 70
    text: Cerrar
]])

  UIx.header("AUTO FOLLOW MC")
  local fUI = UIx.scriptPanel("Auto Follow MC")
  local fWin = UI.createWindow('AutoFollowWindow', rootWidget)
  fWin:hide()

  local lastSt=""
  local function setSt(t,c)
    if t==lastSt then return end
    lastSt=t
    UIx.setLabel(fUI.status, t, c); UIx.setLabel(fWin.status, t, c)
  end

  fWin.names:setText(fc.names or "")
  fWin.names.onTextChange = function(w,t) fc.names = t end
  fWin.priority:setChecked(fc.priority)
  fWin.priority.onCheckChange = function(w,c) fc.priority=c end
  fWin.pausePk:setChecked(fc.pausePk)
  fWin.pausePk.onCheckChange = function(w,c) fc.pausePk=c end
  fWin.closeBtn.onClick = function() fWin:hide() end
  fUI.setupBtn.onClick = function() UIx.toggleWindow(fWin) end

  UIx.bindSwitch(fc, fUI.switch, fWin.enableBtn, function(v)
    if not v then Shared.followTarget=nil; FollowEngine.stop() end
    setSt(v and "Activo" or "Inactivo", v and "#66ff66" or "#888888")
  end)

  -- lista de nombres en orden
  local function nameList()
    local r={}
    for n in (fc.names or ""):gmatch("[^,]+") do
      n=low(n); if n~="" then table.insert(r,n) end
    end
    return r
  end
  local function creatureByName(nl)
    -- devuelve la criatura visible de mayor prioridad de la lista
    for _, want in ipairs(nl) do
      for _, sp in ipairs(getSpectators()) do
        if sp:isPlayer() and not sp:isLocalPlayer() and low(sp:getName())==want then
          return sp, want
        end
      end
    end
    return nil
  end

  local currentName = nil
  -- guardar la pos del target muy seguido para no perderla al cambiar de piso
  macro(20, function()
    if not Shared.followTarget then return end
    pcall(function()
      local tp = Shared.followTarget:getPosition()
      if tp and Shared.FollowEngine.remember then Shared.FollowEngine.remember(tp) end
    end)
  end)
  macro(50, function()
    if not fc.enabled or not g_game.isOnline() then return end
    local nl = nameList()
    if #nl == 0 then setSt("Escribe nombres a seguir", "#ffaa44"); return end
    if fc.pausePk and not Shared.inPz() and #Shared.pkList() > 0 then
      setSt("Pausa: PK en pantalla", "#ffaa44"); return
    end

    -- elegir a quien seguir
    local target
    if fc.priority or not currentName then
      target = creatureByName(nl)         -- siempre el de mayor prioridad visible
    else
      -- quedarse con el actual si sigue visible
      for _, sp in ipairs(getSpectators()) do
        if sp:isPlayer() and low(sp:getName())==currentName then target=sp break end
      end
      if not target then target = creatureByName(nl) end
    end

    if not target then
      -- nadie visible: intentar seguir por la ultima posicion del actual
      if Shared.followTarget then
        FollowEngine.chase(nil)
        setSt("Buscando a "..(currentName or "?").."...", "#ffaa44")
      else
        setSt("Esperando a algun compañero...", "#ffaa44")
      end
      return
    end

    currentName = low(target:getName())
    Shared.followTarget = target
    local r = FollowEngine.chase(target)
    if r=="same" then setSt("Siguiendo a "..target:getName(), "#66ccff")
    elseif r=="floor" then setSt("Siguiendo por piso a "..target:getName().."...", "#66ccff")
    else setSt("Perdi a "..target:getName(), "#ffaa44") end
  end)
end
endSection(__sec)
