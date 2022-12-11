/// Binding address.
const bHost = '127.0.0.1';

// URI path definitions. Make sure that none of them are subset of any other.

const javascriptFile = 'vis_server.js';
const javascript = '/js/vis_server.js';

const cssFile = 'vis_server.css';
const css = '/css/vis_server.css';

const machineHtmlFile = 'machine.html';
const machineRendered = '/machine/rendered/';
const machineSubscribe = '/machine/subscribe/';

const overviewHtmlFile = 'overview.html';
const overviewPage = '/overview/page';
const overviewRendered = '/overview/rendered';
const overviewSubscribe = '/overview/subscribe';

// Define which page to be loaded if user does not provide a path.
const root = overviewPage;

const get = 'GET';
const post = 'POST';

const emptySvg2 = '''
<svg viewBox='0 0 108 95' xmlns='http://www.w3.org/2000/svg'>
<g transform='scale(0.1)'>
<path d='M552,598c-5,10-11,20-12,32c8,11,16,7,25,0c-2-12-7-22-13-32'/>
<path d='M528,7c-17,3-32,13-41,28l-473,820c-10,18-10,39,0,56c10,18,29,29,49,29h947c20,0,39-11,49-29c10-17,10-38,0-56l-473-820c-12-21-35-31-58-28' fill='#fff000'/>
<path d='M532,30c-9,2-17,7-21,15l-477,826c-5,9-5,21,0,30c5,9,15,15,26,15h954c10,0,20-6,26-15c5-9,5-21,0-30l-477-826c-7-11-18-16-31-15M537,126l405,713h-811z'/>
<path d='M582,378l-5,1l1,4l-129,31h-1c-5,3-9,7-10,12c-2,4-2,10,0,14c3,9,12,17,22,16h1l128-28l1,5l5-1zM580,389l8,34l-24,5h-121c1-4,3-7,8-9z'/>
<path d='M383,485l5,2l-1,4l132,19c6,2,10,6,12,11c2,4,2,10,1,14c-2,10-10,18-21,18l-131-17v5h-5zM387,496l-6,35l25,3l120-10v-1c-1-3-4-6-8-8z'/>
<path d='M249,699v43h211v-43h-64l-2,3l-2,4l-4,3c0,0-1,2-2,2h-4c-2,0-3,0-4,1c-1,1-3,1-3,2l-3,4c0,1-1,2-2,2h-4c0,0-2,1-3,0l-3-1c-1,0-3-1-3-2c-1-1,0-2-1-3l-1-3c-1-1-2-1-3-1c-1,0-4,0-4-1c0-2,0-3-1-4v-3v-3z'/>
<path d='M385,593c0,9-6,15-13,15c-7,0-13-6-13-15c0-8,12-39,14-39c1,0,12,31,12,39'/>
<path d='M382,671c0,8-6,15-13,15c-7,0-13-7-13-15c0-8,12-39,13-39c1,0,13,31,13,39'/>
<path d='M614,493c0,9-6,15-13,15c-7,0-13-6-13-15c0-8,12-39,13-39c2,0,13,31,13,39'/>
<path d='M613,591c0,8-6,15-13,15c-7,0-13-7-13-15c0-8,12-39,13-39c1,0,13,31,13,39'/>
<path d='M627,609c-7,0-8,3-7,8c1,6,4,9,7,13c12,10,25,13,37,18v3h-47c-2,6-8,10-15,10c-7,0-13-4-15-10h-4c0,4-4,7-9,7c-4,0-8-3-9-7h-42c-8,0-14,5-14,13c0,8,6,14,14,14h118c1,2,2,4,0,6h-140c-7,0-13,6-13,13c0,8,6,13,13,13h125c2,3,2,6,0,8h-112c-7,0-13,5-13,12c0,7,6,12,13,12h136c1,1,2,4,0,6h-94c-6,0-11,5-11,12c0,6,5,12,11,12h95v1c59,10,129,11,173-11v-105c-49-22-102-34-155-44c-6,1-14-2-19,1c-7-6-15-5-23-5'/>
</g>
</svg>
    ''';
