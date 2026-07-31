/* ==========================================================================
   Accountable Mail Association
   Shared stylesheet. Edit here once, every page updates.
   ========================================================================== */

:root{
  --ink:#0E1F2E;
  --navy:#1F4E79;
  --blue:#2E75B6;
  --pale:#D6E4F0;
  --wash:#F2F7FB;
  --green:#17663F;
  --amber:#8A5A00;
  --paper:#FFFFFF;
  --rule:#D5DEE7;
  --muted:#5A6B7A;
  --display:'Bitter', Georgia, 'Times New Roman', serif;
  --body:'Source Sans 3', Arial, Helvetica, sans-serif;
  --mono:'IBM Plex Mono', 'Courier New', monospace;
  --wrap:1160px;
}

*{box-sizing:border-box}
html{scroll-behavior:smooth; scroll-padding-top:96px}
body{
  margin:0; background:var(--paper); color:var(--ink);
  font-family:var(--body); font-size:17px; line-height:1.62;
  -webkit-font-smoothing:antialiased;
}
.wrap{max-width:var(--wrap); margin:0 auto; padding:0 28px}
.wrap-narrow{max-width:820px; margin:0 auto; padding:0 28px}
a{color:var(--navy)}
h1,h2,h3,h4{font-family:var(--display); font-weight:700; line-height:1.16; margin:0}
p{margin:0 0 1em}
p:last-child{margin-bottom:0}
hr{border:0; border-top:1px solid var(--rule); margin:44px 0}

.eyebrow{
  font-family:var(--mono); font-size:12px; letter-spacing:.14em;
  text-transform:uppercase; color:var(--blue); margin:0 0 14px;
}
.skip{position:absolute; left:-9999px}
.skip:focus{left:12px; top:12px; z-index:200; background:#fff; padding:10px 16px; border:2px solid var(--navy)}

/* ---------------------------------------------------------------- header */
header.site{
  position:sticky; top:0; z-index:60; background:rgba(255,255,255,.97);
  backdrop-filter:saturate(140%) blur(8px); border-bottom:1px solid var(--rule);
}
.bar{display:flex; align-items:center; gap:22px; height:76px}
.mark{display:flex; align-items:center; gap:11px; text-decoration:none; color:var(--ink); flex:none}
.mark .glyph{
  width:34px; height:34px; border-radius:50%; border:2px solid var(--navy);
  display:grid; place-items:center; font-family:var(--mono); font-size:12px;
  font-weight:500; color:var(--navy);
}
.mark .name{font-family:var(--display); font-weight:700; font-size:17px; letter-spacing:-.01em; line-height:1.05}
.mark .name small{display:block; font-family:var(--mono); font-size:10px; font-weight:400;
  letter-spacing:.16em; text-transform:uppercase; color:var(--muted); margin-top:2px}

nav.main{margin-left:auto; display:flex; align-items:center; gap:4px; overflow-x:auto; scrollbar-width:none}
nav.main::-webkit-scrollbar{display:none}
nav.main a{
  font-size:14.5px; text-decoration:none; color:var(--ink); padding:8px 11px;
  border-radius:3px; white-space:nowrap;
}
nav.main a:hover{background:var(--wash); color:var(--navy)}
nav.main a[aria-current="page"]{color:var(--navy); font-weight:600; box-shadow:inset 0 -2px 0 var(--blue)}

.btn{
  display:inline-block; background:var(--navy); color:#fff; text-decoration:none;
  padding:11px 20px; border-radius:3px; font-weight:600; font-size:15px;
  border:1px solid var(--navy); cursor:pointer; transition:background .15s ease;
}
.btn:hover{background:#173C5E}
.btn.ghost{background:transparent; color:var(--navy)}
.btn.ghost:hover{background:var(--wash)}
header.site .btn{flex:none; padding:9px 16px; font-size:14px}

/* ---------------------------------------------------------------- hero */
.hero{padding:70px 0 0; border-bottom:1px solid var(--rule)}
.hero-grid{display:grid; grid-template-columns:1.15fr .85fr; gap:56px; align-items:center}
.hero h1{font-size:clamp(36px,4.4vw,57px); letter-spacing:-.022em}
.hero h1 em{font-style:normal; color:var(--green)}
.hero .lede{font-size:20px; color:#28394A; margin-top:22px; max-width:34em}
.hero .cta{display:flex; gap:12px; flex-wrap:wrap; margin-top:30px}

.stamp-stage{display:flex; justify-content:center; align-items:center; padding:10px 0 40px}
.stamp{
  width:100%; max-width:320px; color:var(--navy); opacity:.92;
  transform:rotate(-7deg); animation:press .85s cubic-bezier(.2,.9,.3,1) both;
}
@keyframes press{
  0%{opacity:0; transform:rotate(-16deg) scale(1.5)}
  62%{opacity:.95; transform:rotate(-6deg) scale(.965)}
  100%{opacity:.92; transform:rotate(-7deg) scale(1)}
}
@media (prefers-reduced-motion:reduce){ .stamp{animation:none} }

/* ---------------------------------------------------------------- strip */
.strip{background:var(--ink); color:#DCE7F0}
.strip .wrap{display:grid; grid-template-columns:repeat(4,1fr)}
.strip .cell{padding:22px 26px 22px 0; border-right:1px solid rgba(255,255,255,.14)}
.strip .cell:last-child{border-right:0}
.strip dt{font-family:var(--mono); font-size:11px; letter-spacing:.14em;
  text-transform:uppercase; color:#7FA8CC; margin-bottom:6px}
.strip dd{margin:0; font-size:16px; font-weight:600; line-height:1.35}

/* ---------------------------------------------------------------- sections */
section{padding:74px 0; border-bottom:1px solid var(--rule)}
section.tint{background:var(--wash)}
.head{max-width:44em; margin-bottom:42px}
.head h2{font-size:clamp(26px,3vw,37px); letter-spacing:-.018em}
.head p{margin-top:16px; font-size:18.5px; color:#33475A}

.two{display:grid; grid-template-columns:1fr 1fr; gap:52px}
.three{display:grid; grid-template-columns:repeat(3,1fr); gap:26px}

/* ---------------------------------------------------------------- topic cards */
.topic-grid{display:grid; grid-template-columns:repeat(3,1fr); gap:20px}
.topic{
  display:flex; flex-direction:column; background:var(--paper);
  border:1px solid var(--rule); border-top:3px solid var(--navy);
  padding:24px 24px 22px; text-decoration:none; color:inherit;
  transition:border-color .15s ease, transform .15s ease;
}
.topic:hover{border-color:var(--blue); transform:translateY(-2px)}
.topic h3{font-size:18.5px; margin-bottom:10px; letter-spacing:-.01em}
.topic p{font-size:15.5px; color:#445769; margin:0}
.topic .go{margin-top:16px; font-family:var(--mono); font-size:12px; letter-spacing:.1em;
  text-transform:uppercase; color:var(--blue)}
.topic.soon{border-top-color:#A9B8C6; background:#FBFCFD}
.topic.soon:hover{transform:none; border-color:var(--rule)}
.topic.soon h3{color:#54677A}

.pill{
  display:inline-block; font-family:var(--mono); font-size:10.5px; letter-spacing:.12em;
  text-transform:uppercase; padding:3px 8px; border-radius:2px; margin-bottom:12px;
}
.pill.live{background:var(--pale); color:var(--navy)}
.pill.draft{background:#EDEFF2; color:#5F7183}
.pill.new{background:#DCEFE3; color:var(--green)}

/* featured topic */
.featured{
  display:grid; grid-template-columns:1.25fr .75fr; gap:44px; align-items:center;
  background:var(--ink); color:#DCE7F0; padding:48px 52px; border-radius:2px;
}
.featured h3{color:#fff; font-size:clamp(24px,2.6vw,33px); letter-spacing:-.02em; margin-bottom:16px}
.featured p{font-size:17.5px; color:#B9CBDB}
.featured .btn{background:#fff; color:var(--ink); border-color:#fff; margin-top:24px}
.featured .btn:hover{background:var(--pale)}
.featured ul{list-style:none; margin:0; padding:0; font-family:var(--mono); font-size:13.5px}
.featured li{padding:11px 0; border-bottom:1px solid rgba(255,255,255,.16); color:#9FBBD3}
.featured li:first-child{border-top:1px solid rgba(255,255,255,.16)}

/* ---------------------------------------------------------------- mission */
.mission{
  background:var(--pale); border-left:5px solid var(--blue);
  padding:32px 36px; font-family:var(--display); font-size:21px;
  line-height:1.45; color:#13334F;
}
.mission .sig{font-family:var(--mono); font-size:12px; letter-spacing:.13em;
  text-transform:uppercase; color:var(--navy); display:block; margin-top:18px}

/* ---------------------------------------------------------------- chain */
.chain{display:grid; grid-template-columns:repeat(5,1fr)}
.link{padding:26px 22px 26px 0; border-top:2px solid var(--navy); position:relative}
.link .n{font-family:var(--mono); font-size:12px; color:var(--blue); letter-spacing:.1em; display:block; margin-bottom:9px}
.link h4{font-size:17px; margin-bottom:8px}
.link p{font-size:14.5px; color:#4A5A69; line-height:1.5}
.link::before{content:""; position:absolute; top:-6px; left:0; width:10px; height:10px;
  background:var(--navy); border-radius:50%}

/* ---------------------------------------------------------------- article pages */
.crumb{font-family:var(--mono); font-size:12px; letter-spacing:.08em; text-transform:uppercase;
  color:var(--muted); padding:22px 0 0}
.crumb a{color:var(--muted); text-decoration:none}
.crumb a:hover{color:var(--blue)}

.article-head{padding:16px 0 44px; border-bottom:1px solid var(--rule)}
.article-head h1{font-size:clamp(32px,3.9vw,50px); letter-spacing:-.022em; max-width:19em}
.article-head .lede{font-size:20px; color:#33475A; margin-top:20px; max-width:38em}
.byline{font-family:var(--mono); font-size:12px; letter-spacing:.09em; text-transform:uppercase;
  color:var(--muted); margin-top:26px; display:flex; gap:22px; flex-wrap:wrap}

.article-layout{display:grid; grid-template-columns:230px 1fr; gap:60px; padding:48px 0 80px; align-items:start}
.toc{position:sticky; top:100px}
.toc h4{font-family:var(--mono); font-size:11px; letter-spacing:.13em; text-transform:uppercase;
  color:var(--muted); font-weight:400; margin-bottom:14px; padding-bottom:10px; border-bottom:1px solid var(--rule)}
.toc ol{list-style:none; margin:0; padding:0; counter-reset:toc}
.toc li{counter-increment:toc; margin-bottom:2px}
.toc a{display:block; padding:7px 0 7px 26px; font-size:14.5px; text-decoration:none;
  color:#41556A; position:relative; line-height:1.35}
.toc a::before{content:counter(toc,decimal-leading-zero); position:absolute; left:0;
  font-family:var(--mono); font-size:11px; color:var(--blue); top:9px}
.toc a:hover{color:var(--navy)}

.prose{max-width:44em}
.prose h2{font-size:29px; letter-spacing:-.016em; margin:52px 0 16px; padding-top:6px}
.prose h2:first-child{margin-top:0}
.prose h3{font-size:20.5px; margin:34px 0 12px}
.prose p{font-size:17.5px; color:#26374A}
.prose ul,.prose ol{padding-left:24px; margin:0 0 1.1em; color:#26374A; font-size:17.5px}
.prose li{margin-bottom:8px}
.prose li strong{color:var(--ink)}
.prose > ul > li::marker{color:var(--blue)}
.prose a{text-decoration-thickness:1px; text-underline-offset:2px}
code{font-family:var(--mono); font-size:.9em; background:var(--wash); padding:2px 6px;
  border:1px solid var(--rule); border-radius:2px; color:var(--navy)}

/* ---------------------------------------------------------------- tables */
table{width:100%; border-collapse:collapse; font-size:16px; background:var(--paper); margin:26px 0}
caption{text-align:left; font-family:var(--mono); font-size:12px; letter-spacing:.12em;
  text-transform:uppercase; color:var(--muted); padding-bottom:12px}
th{background:var(--navy); color:#fff; text-align:left; font-weight:600; padding:13px 16px; font-size:14.5px}
td{padding:14px 16px; border-bottom:1px solid var(--rule); vertical-align:top; color:#33475A}
tbody tr:nth-child(even) td{background:var(--wash)}
td strong{color:var(--ink)}
td code{font-size:.88em}

/* ---------------------------------------------------------------- callouts */
.callout{
  background:var(--pale); border:1px solid var(--blue); border-left-width:5px;
  padding:22px 26px; margin:30px 0; font-size:16.5px; color:#153450;
}
.callout h4{font-size:16.5px; margin-bottom:9px}
.callout p{font-size:16.5px}
.callout.warn{background:#FBF3E2; border-color:var(--amber); color:#4A3300}
.callout.warn h4{color:#5C3F00}
.callout.plain{background:var(--wash); border-color:var(--rule); border-left-color:var(--navy); color:#33475A}

/* sources block */
.sources{border-top:2px solid var(--navy); margin-top:58px; padding-top:24px}
.sources h4{font-family:var(--mono); font-size:11.5px; letter-spacing:.13em; text-transform:uppercase;
  color:var(--navy); font-weight:400; margin-bottom:16px}
.sources ol{list-style:none; margin:0; padding:0; counter-reset:src}
.sources li{counter-increment:src; padding:11px 0 11px 34px; border-bottom:1px solid var(--rule);
  position:relative; font-size:15.5px; color:#44576A}
.sources li::before{content:"[" counter(src) "]"; position:absolute; left:0;
  font-family:var(--mono); font-size:12px; color:var(--blue); top:13px}
.sources a{text-decoration:none}
.sources a:hover{text-decoration:underline}
.sources span{display:block; font-family:var(--mono); font-size:12px; color:var(--muted)}

/* next / prev */
.next-up{display:grid; grid-template-columns:1fr 1fr; gap:20px; margin-top:44px}
.next-up a{display:block; border:1px solid var(--rule); padding:20px 22px; text-decoration:none; color:inherit}
.next-up a:hover{border-color:var(--blue)}
.next-up span{font-family:var(--mono); font-size:11px; letter-spacing:.12em; text-transform:uppercase;
  color:var(--muted); display:block; margin-bottom:7px}
.next-up strong{font-family:var(--display); font-size:17px; color:var(--ink)}

/* ---------------------------------------------------------------- misc */
.fact{border-top:1px solid var(--rule); padding:19px 0; display:grid;
  grid-template-columns:190px 1fr; gap:26px; align-items:start}
.fact:last-child{border-bottom:1px solid var(--rule)}
.fact dt{font-family:var(--mono); font-size:12px; letter-spacing:.1em;
  text-transform:uppercase; color:var(--navy); padding-top:3px}
.fact dd{margin:0; font-size:16.5px; color:#33475A}

.person{border:1px solid var(--rule); padding:24px; background:var(--paper)}
.person .role{font-family:var(--mono); font-size:11px; letter-spacing:.13em;
  text-transform:uppercase; color:var(--green); margin-bottom:10px}
.person h3{font-size:19px; margin-bottom:8px}
.person p{font-size:15.5px; color:#4A5A69}

.res{display:grid; grid-template-columns:repeat(2,1fr); gap:0 44px}
.res a{display:block; padding:16px 0; border-bottom:1px solid var(--rule);
  text-decoration:none; color:var(--ink)}
.res a:hover{color:var(--blue)}
.res a span{display:block; font-family:var(--mono); font-size:12px; color:var(--muted); margin-top:4px}
.res a::after{content:" \2197"; color:var(--blue)}

.post{border-top:1px solid var(--rule); padding:22px 0; display:grid;
  grid-template-columns:150px 1fr; gap:26px}
.post time{font-family:var(--mono); font-size:13px; color:var(--muted); padding-top:4px}
.post h3{font-size:19px; margin-bottom:8px}
.post p{font-size:16px; color:#4A5A69}

/* forms */
.form{background:var(--paper); border:1px solid var(--rule); padding:32px}
.field{margin-bottom:18px}
label{display:block; font-size:14px; font-weight:600; margin-bottom:6px; color:#28394A}
input,select,textarea{
  width:100%; font-family:var(--body); font-size:16px; padding:11px 13px;
  border:1px solid #B9C7D4; border-radius:3px; background:#fff; color:var(--ink);
}
input:focus,select:focus,textarea:focus{outline:2px solid var(--blue); outline-offset:1px; border-color:var(--blue)}
textarea{min-height:110px; resize:vertical}
.row{display:grid; grid-template-columns:1fr 1fr; gap:18px}
.note{font-size:14px; color:var(--muted); margin-top:14px}

a:focus-visible, button:focus-visible, .btn:focus-visible{outline:2px solid var(--blue); outline-offset:3px}

/* ---------------------------------------------------------------- footer */
footer.site{background:var(--ink); color:#B9CBDB; padding:54px 0 32px; font-size:15px}
footer.site a{color:#CFE0EE; text-decoration:none}
footer.site a:hover{text-decoration:underline}
.fgrid{display:grid; grid-template-columns:1.5fr 1fr 1fr 1fr; gap:36px; padding-bottom:32px}
footer.site h4{color:#fff; font-size:15px; margin-bottom:14px; font-family:var(--body); font-weight:700}
footer.site ul{list-style:none; margin:0; padding:0}
footer.site li{margin-bottom:9px}
.legal{border-top:1px solid rgba(255,255,255,.16); padding-top:20px;
  display:flex; justify-content:space-between; gap:20px; flex-wrap:wrap;
  font-family:var(--mono); font-size:12px; color:#8AA6BD}

/* ---------------------------------------------------------------- responsive */
@media (max-width:1000px){
  .article-layout{grid-template-columns:1fr; gap:34px}
  .toc{position:static; border:1px solid var(--rule); padding:20px 22px; background:var(--wash)}
  .topic-grid{grid-template-columns:1fr 1fr}
}
@media (max-width:900px){
  .hero-grid,.two,.three,.res,.row,.next-up,.featured{grid-template-columns:1fr}
  .featured{padding:34px 28px; gap:28px}
  .chain{grid-template-columns:1fr 1fr}
  .strip .wrap{grid-template-columns:1fr 1fr}
  .strip .cell{border-right:0; border-bottom:1px solid rgba(255,255,255,.14)}
  .fgrid{grid-template-columns:1fr 1fr}
  nav.main{display:none}
  .hero{padding-top:44px}
  section{padding:54px 0}
  .fact,.post{grid-template-columns:1fr; gap:8px}
  .prose h2{font-size:25px; margin-top:42px}
}
@media (max-width:560px){
  .chain,.topic-grid,.fgrid{grid-template-columns:1fr}
  .strip .wrap{grid-template-columns:1fr}
  .mission{padding:24px 22px; font-size:19px}
  body{font-size:16.5px}
}

@media print{
  header.site,footer.site,.toc,.next-up,nav.main{display:none}
  .article-layout{grid-template-columns:1fr}
  body{font-size:11pt; font-family:Arial, Helvetica, sans-serif}
  .prose{max-width:none}
}
