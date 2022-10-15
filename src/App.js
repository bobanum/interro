export default class App {
    static init() {
        return new Promise(resolve => {
            resolve();
            this.main();
        })
    }
    static main() {

        Promise.all([this.loadXML("../xml/interro.xsd"), this.loadXML("../xsl/xsd-form.xsl")]).then(data => {
            var [xml, xsl] = data;
            document.body.appendChild(this.process(xml, xsl));
        });
        return;
        Promise.all([this.loadXML("../xml/premierinterro.xml"), this.loadXML("../xsl/interro-edit.xsl"), this.loadXML("../xsl/interro-print.xsl")]).then(data => {
            console.log(data);
            var [xml, xslEdit, xslPrint] = data;
            document.body.appendChild(this.process(xml, xslEdit));
            document.body.appendChild(this.process(xml, xslPrint));
            console.log(tinyMCE);
            tinyMCE.init({
                selector: "textarea.html",
                skin: 'oxide-dark',
                height: '8em',
                menubar: false,
                statusbar: false,
                plugins: [
                    'autoresize advlist autolink lists link image charmap print preview anchor',
                    'searchreplace visualblocks code fullscreen',
                    'insertdatetime media table contextmenu paste code',
                    'textcolor'
                ],
                fontsize_formats: '8pt 9pt 10pt 11pt 12pt 14pt 18pt 20pt 22pt 24pt 26pt 28pt 36pt 48pt 72pt',
                toolbar: ['undo redo styles forecolor fontselect fontsizeselect styleselect bold italic align bullist numlist outdent indent code'],
                plugins: 'code',
                formatsz: {
                    alignleft: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,audio,video', classes: 'left' },
                    aligncenter: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,audio,video', classes: 'center' },
                    alignright: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,audio,video', classes: 'right' },
                    alignfull: { selector: 'p,h1,h2,h3,h4,h5,h6,td,th,div,ul,ol,li,table,img,audio,video', classes: 'full' },
                    bold: { inline: 'span', classes: 'bold' },
                    italic: { inline: 'span', classes: 'italic' },
                    underline: { inline: 'span', classes: 'underline', exact: true },
                    strikethrough: { inline: 'del' },
                    customformat: { inline: 'span', styles: { color: '#00ff00', fontSize: '20px' }, attributes: { title: 'My custom format' }, classes: 'example1' }
                },

                zstyle_formats: [
                    { title: 'Custom format', format: 'headings' },
                    { title: 'Align left', format: 'alignleft' },
                    { title: 'Align center', format: 'aligncenter' },
                    { title: 'Align right', format: 'alignright' },
                    { title: 'Align full', format: 'alignfull' },
                    { title: 'Bold text', inline: 'strong' },
                    { title: 'Red text', inline: 'span', styles: { color: '#ff0000' } },
                    { title: 'Red header', block: 'h1', styles: { color: '#ff0000' } },
                    { title: 'Badge', inline: 'span', styles: { display: 'inline-block', border: '1px solid #2276d2', 'border-radius': '5px', padding: '2px 5px', margin: '0 2px', color: '#2276d2' } },
                    { title: 'Table row 1', selector: 'tr', classes: 'tablerow1' },
                    { title: 'Image formats' },
                    { title: 'Image Left', selector: 'img', styles: { 'float': 'left', 'margin': '0 10px 0 10px' } },
                    { title: 'Image Right', selector: 'img', styles: { 'float': 'right', 'margin': '0 0 10px 10px' } },
                ],
            });
        });
    }
    static process(xml, xsl) {
        var xsltProcessor = new XSLTProcessor();
        try {
            xsltProcessor.importStylesheet(xsl);
        } catch (erreur) {
            console.log(xsltProcessor);
        }
        return xsltProcessor.transformToFragment(xml, document);
    }
    static loadXML(path) {
        return new Promise(resolve => {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", path);
            xhr.responseType = "document";
            xhr.addEventListener("load", e => {
                resolve(e.currentTarget.response);
            });
            xhr.send();
        });
    }
}
App.init();