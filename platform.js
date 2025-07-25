let text = `<div id=\"topbar\"><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" />
<input type=\"text\" id=\"filterInput\" placeholder=\"Filter...\"><span id=\"pocet\"></span>
<input type=\"radio\" name=\"thumbtype\" id=\"Snaps\" value=\"Snaps\" checked onclick=\"snaps()\"><label for=\"Snaps\">Snaps</label>
<input type=\"radio\" name=\"thumbtype\" id=\"Titles\" value=\"Titles\" onclick=\"titles()\"><label for=\"Titles\">Titles</label>
<input type=\"radio\" name=\"thumbtype\" id=\"Boxarts\" value=\"Boxarts\" onclick=\"boxarts()\"><label for=\"Boxarts\">Boxarts</label>
<input type=\"radio\" name=\"thumbtype\" id=\"Logos\" value=\"Logos\" onclick=\"logos()\"><label for=\"Logos\">Logos</label>
<input type=\"radio\" name=\"size\" id=\"80px\" value=\"80px\" onclick=\"change80()\"><label for=\"80px\">80px</label>
<input type=\"radio\" name=\"size\" id=\"120px\" value=\"120px\" onclick=\"change120()\"><label for=\"120px\">120px</label>
<input type=\"radio\" name=\"size\" id=\"160px\" value=\"160px\" onclick=\"change160()\" checked><label for=\"160px\">160px</label>
<input type=\"radio\" name=\"size\" id=\"240px\" value=\"240px\" onclick=\"change240()\"><label for=\"240px\">240px</label>
<input type=\"radio\" name=\"size\" id=\"320px\" value=\"320px\" onclick=\"change320()\"><label for=\"320px\">320px</label>
<br />
<input type=\"checkbox\" id=\"showHideProto\" checked><label for=\"showHideProto\">Proto</label>
<input type=\"checkbox\" id=\"showHideProgram\" checked><label for=\"showHideProgram\">Program</label>
<input type=\"checkbox\" id=\"showHideAlfa\"><label for=\"showHideAlfa\">Alpha</label>
<input type=\"checkbox\" id=\"showHideBeta\"><label for=\"showHideBeta\">Beta</label>
<input type=\"checkbox\" id=\"showHidePrerelease\"><label for=\"showHidePrerelease\">Pre</label>
<input type=\"checkbox\" id=\"showHideDemo\"><label for=\"showHideDemo\">Demo</label>
<input type=\"checkbox\" id=\"showHideAftermarket\"><label for=\"showHideAftermarket\">After</label>
<input type=\"checkbox\" id=\"showHideUnl\"><label for=\"showHideUnl\">Unl</label>
<input type=\"checkbox\" id=\"showHideAlt\"><label for=\"showHideAlt\">Alt</label>
<input type=\"checkbox\" id=\"showHidePirate\"><label for=\"showHidePirate\">Pirate</label>
<input type=\"checkbox\" id=\"showHideBrackets\"><label for=\"showHideBrackets\">[a][b]</label>
<input type=\"checkbox\" id=\"showHideDisk\"><label for=\"showHideDisk\">[disk 2]</label>
<br /><br /></div><br /><br /><br />`;

document.write(text);
function bgImage(platform) { document.write(`<style> figure { background-image: url('https://raw.githubusercontent.com/fabricecaruso/es-theme-carbon/master/art/consoles/${platform}.png'); } </style>`); }

function generateTicLinks(romPath, imagePath) {
    document.write("<div id=\"figureList\">");
    if (location.protocol !== "file:" && romPath.includes("roms/TIC-80")) { romPath = romPath.replace("roms/TIC-80", "https://tic80.com/play?cart="); web = true; } else { romPath = `../${romPath}/`; web = false; }
    fileNames.forEach(fileName => {
        let [id, hash, nazov] = fileName.split('\t'); if (web) { cart = `${id}`; } else { cart = `${hash}.tic`; }
        document.write(`<a href="${romPath}${cart}" target="main">
        <figure><img loading="lazy" src="https://tic80.com/cart/${hash}/cover.gif" alt="${nazov}"><figcaption>${nazov}</figcaption></figure></a>`);
    }); document.write("</div>");
}

function generateWasmLinks(romPath, imagePath) {
    document.write("<div id=\"figureList\">");
    if (location.protocol !== "file:" && romPath.includes("roms/WASM-4")) { romPath = romPath.replace("roms/WASM-4", "https://wasm4.org/play"); wasm = ``; } else { romPath = `../${romPath}`; wasm = `.wasm`; }
    fileNames.forEach(fileName => {
        const [subor, nazov] = fileName.split('\t');
        document.write(`<a href="${romPath}/${encodeURIComponent(subor)}${wasm}" target="main">
        <figure><img loading="lazy" src="https://wasm4.org/carts/${subor}.png" alt="${nazov}"><figcaption>${nazov}</figcaption></figure></a>`);
    }); document.write("</div>");
}

function generateLrNXLinks(romPath, imagePath) {
    document.write("<div id=\"figureList\">");
    if (location.protocol !== "file:" && romPath.includes("roms/LowresNX")) { romPath = romPath.replace("roms/LowresNX", "https://lowresnx.inutilis.com/topic.php?id="); web = true; } else { romPath = `../${romPath}/`; web = false; }
    fileNames.forEach(fileName => {
        let [subor, obrazok, nazov, id] = fileName.split('\t'); if (web) { subor = `${id}`; }
        document.write(`<a href="${romPath}${encodeURIComponent(subor)}" target="main">
        <figure><img loading="lazy" src="https://lowresnx.inutilis.com/uploads/${obrazok}" alt="${nazov}"><figcaption>${nazov}</figcaption></figure></a>`);
    }); document.write("</div>");
}

function generatePicoLinks(romPath, imagePath) {
    document.write("<div id=\"figureList\">"); fileNames.forEach(fileName => {
        const [id, nazov, kart] = fileName.split('\t'); let screen;
        if (/^\d/.test(kart)) { screen = "pico" + kart.replace(/\.p8\.png$/, '.png'); } else { screen = kart.replace(/^(.*)\.p8\.png$/, 'pico8_$1.png'); }
        let cart = kart.replace(/\.p8.png$/, "");
        document.write(`<a href="https://www.lexaloffle.com/bbs/?pid=${cart}#p" target="main">
        <figure><img loading="lazy" src="https://www.lexaloffle.com/bbs/thumbs/${screen}" alt="${nazov}"><figcaption>${nazov}</figcaption></figure></a>`);
    }); document.write("</div>");
}

function generateVoxLinks(romPath, imagePath) {
    document.write("<div id=\"figureList\">"); fileNames.forEach(fileName => {
        const [id, nazov, kart] = fileName.split('\t');
        let screen; screen = kart.replace(/^(.*)\.vx\.png$/, 'vox_$1.png'); screen = screen.replace(/^cpost/, "vox");
        let cart = kart.replace(/^cpost/, ""); cart = cart.replace(/\.png$/, "");
        document.write(`<a href="https://www.lexaloffle.com/bbs/?pid=${cart}#p" target="main">
        <figure><img loading="lazy" src="https://www.lexaloffle.com/bbs/thumbs/${screen}" alt="${nazov}"><figcaption>${nazov}</figcaption></figure></a>`);
    }); document.write("</div>");
}

function generateUzeLinks(romPath, imagePath) {
    document.write("<div id=\"figureList\">");
    if (location.protocol !== "file:" && romPath.includes("roms/Uzebox")) { romPath = romPath.replace("roms/Uzebox", "https://nicksen782.net/UAM/APP_emu/emu.php?gameid="); web = true; } else { romPath = `../${romPath}/`; web = false; }
    fileNames.forEach(fileName => {
        let [id, subor, nazov] = fileName.split('\t'); 
        const nameWithoutExt = subor.slice(0, subor.lastIndexOf(".")) || subor; 
        if (web) { cart = `${id}`; } else { cart = `${subor}`; }
        document.write(`<a href="${romPath}${encodeURIComponent(cart)}" target="main">
        <figure><img loading="lazy" src="https://raw.githubusercontent.com/WizzardSK/${imagePath}/master/Named_Snaps/${encodeURIComponent(nameWithoutExt)}.png" alt="${nazov}"><figcaption>${nazov}</figcaption></figure></a>`);
    }); document.write("</div>");
}

function generateFileLinks(romPath, imagePath) {
    document.write("<div id=\"figureList\">");
    if (location.protocol !== "file:") {
        if (romPath.includes("eXoDOS")) { romPath = romPath.replace("roms/MS-DOS eXoDOS", "https://the-eye.eu/public/Games/eXo/eXoDOS_v6r2/eXo/eXoDOS"); }
        if (romPath.startsWith("myrient/")) { romPath = romPath.replace("myrient", "https://myrient.erista.me/files"); }
        if (romPath.startsWith("roms/Vircon32")) { romPath = romPath.replace("roms/Vircon32", "https://archive.org/download/all_vircon32_roms_and_media/all_vircon32_roms_and_media"); }
        if (romPath.startsWith("roms/Neo Geo")) { romPath = romPath.replace("roms/Neo Geo", "https://myrient.erista.me/files/Internet%20Archive/chadmaster/mame-merged/mame-merged"); }
    } else { romPath = "../" + romPath }
    fileNames.forEach(fileName => {
        const subor = fileName.includes("\t") ? fileName.split("\t")[0] : fileName;
        const nameWithoutExt = subor.slice(0, subor.lastIndexOf(".")) || subor;
        const nazov = fileName.includes("\t") ? fileName.split("\t")[1] : fileName.replace(/\.[^.]+$/, "");
        document.write(`<a href="${romPath}/${encodeURIComponent(subor)}" target="main">
        <figure><img loading="lazy" src="https://raw.githubusercontent.com/WizzardSK/${imagePath}/master/Named_Snaps/${encodeURIComponent(nameWithoutExt)}.png" alt="${nameWithoutExt}"><figcaption>${nazov}</figcaption></figure></a>`);
    }); document.write("</div>");
}
