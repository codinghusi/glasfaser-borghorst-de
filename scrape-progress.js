const { JSDOM } = require('jsdom');
const fetch = require('node-fetch');
const fs = require('fs/promises');

async function scrapeProgress(html) {
    const dom = new JSDOM(html);
    const progressStr = dom.window.document.querySelector(".loadingbar .inner .progress .text").innerHTML
    return parseInt(progressStr);
}

fetch(`https://www.deutsche-glasfaser.de/netzausbau/gebiete/borghorst/`).then(async response => {
    const html = await response.text();
    const progress = await scrapeProgress(html);
    const data = { progress };
    await fs.writeFile("./public/data.json", JSON.stringify(data));    
});
