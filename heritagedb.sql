-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Creato il: Feb 01, 2022 alle 10:56
-- Versione del server: 10.4.22-MariaDB
-- Versione PHP: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `heritagedb`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `admin`
--

CREATE TABLE `admin` (
  `nome_admin` varchar(50) NOT NULL,
  `password_admin` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struttura della tabella `commenti`
--

CREATE TABLE `commenti` (
  `id` int(100) NOT NULL,
  `commento` text NOT NULL,
  `id_utente` int(100) NOT NULL,
  `id_documento` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `commenti`
--

INSERT INTO `commenti` (`id`, `commento`, `id_utente`, `id_documento`, `data`) VALUES
(1, 'WOW che meraviglia!', 1, 1, '2022-01-28'),
(2, 'Troppo buona!', 2, 1, '2022-01-28');

-- --------------------------------------------------------

--
-- Struttura della tabella `documenti`
--

CREATE TABLE `documenti` (
  `id` int(100) NOT NULL,
  `titolo` varchar(100) NOT NULL,
  `data` date NOT NULL DEFAULT current_timestamp(),
  `amministratore` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `documenti`
--

INSERT INTO `documenti` (`id`, `titolo`, `data`, `amministratore`) VALUES
(1, 'Avellino', '2022-01-27', 0),
(2, 'Benevento', '2022-01-23', 0),
(3, 'Caserta', '2022-01-11', 0),
(4, 'Salerno', '2022-01-28', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `sezioni`
--

CREATE TABLE `sezioni` (
  `id` int(11) NOT NULL,
  `iframe` longtext NOT NULL,
  `testo` longtext NOT NULL,
  `id_documento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dump dei dati per la tabella `sezioni`
--

INSERT INTO `sezioni` (`id`, `iframe`, `testo`, `id_documento`) VALUES
(1, '<div class=\"sketchfab-embed-wrapper\"> <iframe title=\"Castello Filangieri\" frameborder=\"0\" allowfullscreen mozallowfullscreen=\"true\" webkitallowfullscreen=\"true\" allow=\"autoplay; fullscreen; xr-spatial-tracking\" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src=\"https://sketchfab.com/models/65b8742974ea488aa59173d046563d4e/embed\"> </iframe> </div>', 'Il Palazzo Baronale dei Filangieri, che sorge nel punto più alto del centro storico di Lapio, è l’espressione del periodo di maggior splendore della famiglia nobiliare, raggiunto nel corso dei secoli XVII e XVIII. Il palazzo baronale dei Filangieri, che sorge nel punto più alto del centro storico di Lapio, così come si presenta oggi, è l’espressione del periodo di maggior splendore della famiglia nobiliare, raggiunto nel corso dei secoli XVII e XVIII. Un casato illustre, le cui origini si fanno risalire all’epoca dei Normanni, i suoi rappresentanti erano i figli di Angerio il Normanno – Filii Angerii e quindi Filangieri, venuto in Italia, nel corso dell’XI secolo, al seguito di Roberto I il Guiscardo. Da quell’epoca fino al XVIII secolo si annoverano, all’interno della famiglia, numerose figure di notevole rilievo. Uno dei personaggi di spicco, è rappresentato da Riccardo Filangieri, che seguì l’Imperatore Federico II di Svevia nella crociata del 1228 e si meritò la nomina a Governatore di Gerusalemme. Da allora i componenti del casato si fregiano del titolo di crociati, sicché il suo simbolo araldico diventa la croce, che ritroviamo rappresentata dovunque negli stemmi e nei documenti ufficiali. Del rapporto di vicinanza e di condivisione delle idee col grande imperatore, troviamo espressione nelle scelte estetiche presenti all’interno della dimora gentilizia: la vera del pozzo di forma ottagonale.', 1),
(2, '<iframe src=\"https://3dwarehouse.sketchup.com/embed/b26d4cb3e21f3d16be50da8af527b936\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" width=\"580\" height=\"326\" allowfullscreen></iframe>', 'Il Castello Normanno di Ariano Irpino sorge in una posizione strategica facilmente difendibile, grazie alle barriere naturali, agli scoscendimenti e ai dirupi che lo circondano. Le sue antiche origini sono attestate da un documento risalente all’892 e custodito nella Badia di Cava de’ Tirreni. Il castello fu al centro di diversi assedi e battaglie che evidenziarono la sua inespugnabilità dovuta, oltre che alle condizioni geografiche del luogo, anche alla rete di vie sotterranee che si estendeva al di là delle mura. Nel 1139 Ruggero II, non riuscendo ad espugnare il maniero, devastò tutte le terre circostanti, anche se poi, nel 1140, entrò da vincitore nella città. Proprietà di illustri famiglie tra cui gli Sforza, i Gonzaga e i Carafa, il castello subì importanti rifacimenti nel corso del XVI secolo, per poi essere abbandonato già nella prima metà del XVII secolo. Dell’originaria costruzione a pianta trapezoidale sono visibili, oggi, quattro grandi torri angolari, costruite con blocchetti squadrati di tufo, collegate tra loro attraverso corridoi ricavati nello spessore dei bastioni e dotate ancora delle cortine murarie. Nel 1992, gli scavi archeologici effettuati all’interno dell’area delimitata dal circuito difensivo, hanno portato alla luce la cosiddetta Torre Grande, di forma quadrangolare, cui si accedeva tramite un ponte levatoio. Il castello è oggi circondato dal verde dell’antica villa comunale, dalla quale si gode di un suggestivo panorama.', 1),
(3, '<iframe src=\"https://3dwarehouse.sketchup.com/embed/2df3ff15b198d0bd577d53b3699f0111\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" width=\"580\" height=\"326\" allowfullscreen></iframe>', 'L’arco di Traiano è un’opera unica al mondo. Simbolo di Benevento, rappresenta una testimonianza ben conservata della civiltà romana. Per la sua edificazione si indica la data del 114 d.c. Venne costruito per celebrare la figura dell’imperatore Traiano in occasione dell’inaugurazione della via Appia, strada che collegava Roma a Brindisi. Per la sua grandezza, venne nei secoli chiamato “Porta Aurea”. E Traiano viene ricordato come “Optimus”, principe illuminato la cui fama è giunta intatta fino ai nostri giorni. Lo stesso Dante lo poneva in Paradiso a testimonianza di una grandezza indiscussa. La ricca decorazione scultoria mostra temi diversi su ogni facciata: quella interna, che guarda alla città e ai cittadini, si rivolge alla pace e alla provvidenza mentre quella esterna che guarda alle province si riferisce alla guerra e alle provvidenze dell’imperatore. L’attico presenta un’iscrizione dedicatoria centrale e due pannelli a bassorilievo: quello esterno conteneva due raffigurazioni, quella a sinistra era un omaggio alle Divinità agresti mentre quella a destra la Deduzione di Colonie provinciali. Il pannello sul lato interno anch’esso contenente due raffigurazioni, presentava a sinistra Traiano accolto dalla Triade capitolina e a destra Traiano nel Foro Boario. Il fregio della trabeazione raffigura la processione per il trionfo di Traiano sulla Dacia, ad altissimo rilievo.', 2),
(4, '<div class=\"sketchfab-embed-wrapper\"><iframe title=\"Benevento - Obelisco Integro\" frameborder=\"0\" allowfullscreen mozallowfullscreen=\"true\" webkitallowfullscreen=\"true\" allow=\"autoplay; fullscreen; xr-spatial-tracking\" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src=\"https://sketchfab.com/models/2e08f362b0124cb798893aa13d778d84/embed\"> </iframe></div>', 'L\'obelisco egizio di Benevento, facente parte dell\'antico tempio della Dea Iside, è un originale pezzo di storia egizia: giunse direttamente dall\'Egitto per la costruzione del tempio della dea, che fu protettrice della città di Benevento durante l\'ultimo periodo dell\'impero Romano. La presenza dell\'obelisco conferma che, un tempo, la città di Benevento avesse un culto molto importante, tale da essere uno dei centri più conosciuti nell\'Impero, dopo lo stesso Egitto. Con il tempo, il culto della dea Iside è stato sostituito interamente dalla religione cattolica: secondo una leggenda, il tempio sarebbe stato distrutto da San Barbato, sui cui resti sarebbe stata costruita la chiesa di Santa Maria delle Grazie. La dea Iside però non venne dimenticata dai beneventani con facilità: fu sì sostituita dalla figura della Madonna, ma anche collegata a un altro  personaggio molto importante della nostra storia: le streghe.\r\nBenevento, conosciuta come città delle streghe, continuò un culto segreto per la dea Iside, soprattutto nelle donne sole che vivevano nelle campagne o comunque al di fuori delle mura cittadine.\r\n', 2),
(5, '<div class=\"sketchfab-embed-wrapper\"> <iframe title=\"Caroline Aqueduct Of Vanvitelli\" frameborder=\"0\" allowfullscreen mozallowfullscreen=\"true\" webkitallowfullscreen=\"true\" allow=\"autoplay; fullscreen; xr-spatial-tracking\" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src=\"https://sketchfab.com/models/44015488809e4cdb9077b56944a52abc/embed\"> </iframe> </div>', 'L\'Acquedotto Carolino o del Vanvitelli fu per largo tempo il ponte più lungo d\'Europa, con la sua lunghezza di 38 chilometri. Aveva, infatti, il compito di portare l\'acqua dalle falde del monte Taburno (Benevento) fino alla Reggia di Caserta. L’acquedotto che passa sulla parte superiore della struttura fu iniziato nel 1753 fu completato nel 1770. L’opera del Vanvitelli ha acquistato rilevanza anche a livello storico e non solo architettonico, essendo stato luogo di una delle battaglie fondamentali per l\'Unità di Italia dove a difesa delle città di Maddaloni e di Caserta si schierò l\'esercito di 5.600 uomini capeggiati da Nino Bixio. l’Acquedotto, lungo 38 chilometri, commissionato dal Re Carlo III di Borbone, da cui il nome “Carolino”, dichiarato Patrimonio dell’Umanità dall’UNESCO nel 1997 e i cui lavori iniziarono nel marzo del 1753 per alimentare gli spettacolari giochi d’acqua nei giardini della Reggia di Caserta e il non lontano complesso produttivo di San Leucio. Tale costruzione, comunemente nota come “I Ponti della Valle”, si innalza con una possente struttura in tufo a tre ordini di arcate per una lunghezza di 529 metri e con un’altezza massima di 55,80 metri, sul modello degli acquedotti romani. Dalla grotta artificiale posta a conclusione del grande parco progettato dal Vanvitelli e completato dal figlio Carlo, una diramazione conduce all’edificio Belvedere, la celebre filanda, voluta da Ferdinando IV per la produzione e tessitura della seta, realizzata recuperando l’antico casino cinquecentesco degli Acquaviva, che ancora conserva i giardini di impronta rinascimentale arricchiti da gruppi scultorei e fontane, nonché i giardini del XIX secolo dove una grande cisterna accoglie le acque del Carolino per far funzionare il “rotone ad acqua” della filanda. E infine, dopo aver attraversato il Bosco Vecchio, un ramo del Carolino raggiunge Carditello, fattoria modello voluta sempre da Ferdinando IV.', 3),
(6, '<iframe src=\"https://3dwarehouse.sketchup.com/embed/ef2a7bc7c07f31342a38e5bcee848e4b\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" width=\"580\" height=\"326\" allowfullscreen></iframe>', 'Nel 1750 Carlo di Borbone (1716-1788) decise di erigere la Reggia quale centro ideale del nuovo regno di Napoli, ormai autonomo e svincolato dall’egida spagnola. La scelta del luogo dove sarebbe sorta la nuova capitale amministrativa del Regno cadde sulla pianura di Terra di Lavoro, nel sito dominato dal cinquecentesco palazzo degli Acquaviva. Il progetto per l’imponente costruzione, destinata a rivaleggiare con le altre residenze reali europee, fu affidato, dopo alterne vicende, all’architetto Luigi Vanvitelli (1700-1773), figlio del più importante pittore di vedute, Gaspar Van Wittel, già attivo a Roma sotto Benedetto XIV nel restauro della cupola di S.Pietro. La costruzione della Reggia ebbe inizio con la posa della prima pietra il 20 gennaio del 1752 e procedette alacremente sino al 1759, anno in cui Carlo di Borbone, morto il Re di Spagna, lasciò il regno di Napoli per raggiungere Madrid. Dopo la partenza di Carlo i lavori di costruzione del Palazzo nuovo, come veniva denominata all\'epoca la Reggia, subirono un notevole rallentamento, cosicché alla morte di Luigi Vanvitelli, nel 1773, essi erano ancora lungi dall\'essere completati. Carlo Vanvitelli, figlio di Luigi e successivamente altri architetti, che si erano formati alla scuola del Vanvitelli, portarono a compimento nel secolo successivo questa grandiosa residenza reale.', 3),
(8, '<div class=\"sketchfab-embed-wrapper\"> <iframe title=\"Tempel of Hera I & II | Italy, Paestum\" frameborder=\"0\" allowfullscreen mozallowfullscreen=\"true\" webkitallowfullscreen=\"true\" allow=\"autoplay; fullscreen; xr-spatial-tracking\" xr-spatial-tracking execution-while-out-of-viewport execution-while-not-rendered web-share src=\"https://sketchfab.com/models/6dd6bcf909cd4025b4c073bce7e33ccc/embed\"> </iframe></div>', 'Più noto come Basilica, dal nome che gli dettero gli eruditi del settecento per la quasi totale sparizione dei muri della cella, del frontone e della trabeazione.\r\nE\' in realtà dedicato ad Hera, sposa di Zeus e principale divinità di Poseidonia.\r\nE\' un Periptero con nove colonne sui fronti e diciotto sui lati (m. 24,35x54),la cella ha ben conservato il pronao, in corrispondenza del numero dispari delle colonne sul fronte ed è dipartita da un colonnato centrale, in parte conservato e destinato a sostenere il culmine del tetto. Sul retro della cella è l\'adyton, ambiente inaccessibile ai fedeli a sede del tesoro del tempio. Singolare particolarità, fra tutti i monumenti dell\'architettura dorica, offre qui e nel tempio di Cerere il collarino del capitello decorato di foglie baccellate e talvolta contornate sulla curva dell\'echino da una fascia di fiori di loto e di rosette. Negli scavi del 1912 si raccolsero molti elementi della decorazione fittile.\r\nIl coronamento del tempio era in terracotta dipinta con finte grondaie a testa di leone e terminava con antefisse a forma di palmetta.\r\n', 4);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `commenti`
--
ALTER TABLE `commenti`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refdocumento` (`id_documento`);

--
-- Indici per le tabelle `documenti`
--
ALTER TABLE `documenti`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `sezioni`
--
ALTER TABLE `sezioni`
  ADD PRIMARY KEY (`id`),
  ADD KEY `refdocumento2` (`id_documento`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `commenti`
--
ALTER TABLE `commenti`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT per la tabella `documenti`
--
ALTER TABLE `documenti`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `sezioni`
--
ALTER TABLE `sezioni`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `commenti`
--
ALTER TABLE `commenti`
  ADD CONSTRAINT `refdocumento` FOREIGN KEY (`id_documento`) REFERENCES `documenti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `sezioni`
--
ALTER TABLE `sezioni`
  ADD CONSTRAINT `refdocumento2` FOREIGN KEY (`id_documento`) REFERENCES `documenti` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
