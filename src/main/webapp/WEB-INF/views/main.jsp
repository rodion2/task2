<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!--
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Confirmed</title>

<link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container">
<c:if test="${pageContext.request.userPrincipal.name != null}">
    <form id="logoutForm" method="post" action="${contextPath}/logout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    </form>
    <h2>
    Welcome ${pageContext.request.userPrincipal.name}.
    </h2>
    <h2>
    Our site already in deployment
    </h2>
    <h2>
    <a onclick="document.forms['logoutForm'].submit()">Logout</a>
    </h2>
</c:if>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>

</body>
</html>-->
<!DOCTYPE html>
<html lang="en" ng-app="kitchensink">
<head>
    <meta charset="utf-8">

    <title>Hey-hey,la-la-ley:)</title>

    <link rel="stylesheet" href="/resources/css/master.css">
    <link rel="stylesheet" href="/resources/css/prism.css">
    <style>
        pre {
            margin-left: 15px !important
        }
    </style>

    <!--[if lt IE 9]>
    <script src="../lib/excanvas.js"></script>
    <script src="${contextPath}/resources/js/fabric.js"></script>
    <![endif]-->

    <script src="/resources/lib/prism.js"></script>
    <script>
        (function () {
            var fabricUrl = '/resources/js/fabric.js';
            if (document.location.search.indexOf('load_fabric_from=') > -1) {
                var match = document.location.search.match(/load_fabric_from=([^&]*)/);
                if (match && match[1]) {
                    fabricUrl = match[1];
                }
            }
            document.write('<script src="' + fabricUrl + '"><\/script>');
        })();
    </script>
    <script src="/resources/js/master.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.6/angular.min.js"></script>
</head>
<body>
<ul id="header">
    <h2>Photomaker</h2>
    <!--<li><a href="http://fabricjs.com/">Home</a></li>
    <li><a href="http://fabricjs.com/demos">Demos</a></li>
    <li><a href="http://fabricjs.com/articles">Tutorial</a></li>
    <li><a href="http://fabricjs.com/docs">Docs</a></li>
    <li><a href="http://fabricjs.com/build">Custom Build</a></li>
    <li><a href="http://fabricjs.com/help">Support</a></li>
    <li><a href="http://fabricjs.com/test">Tests/Benchmarks</a></li>
    <li><a href="http://fabricjs.com/team">Team</a></li>-->

    <!--<li class="secondary">
         <a href="https://codeclimate.com/repos/526a0ed089af7e6cf2001389/feed">
             <img src="https://codeclimate.com/repos/526a0ed089af7e6cf2001389/badges/d1c922dd1511ffa8a72f/gpa.png">
         </a>
        <!-- <a href="http://travis-ci.org/#!/kangax/fabric.js">
             <img src="https://api.travis-ci.org/kangax/fabric.js.png?branch=master">
         </a>-->
    <%--</li>-->--%>
    <!--<li class="gittip secondary">
        <iframe style="border: 0; margin: 0; padding: 0;"
                src="https://www.gittip.com/kangax/widget.html" width="48pt" height="22pt"></iframe>
    </li>-->
    <!--<li class="flattr secondary">
        <a class="FlattrButton" style="display:none;" rev="flattr;button:compact;" href="http://kangax.github.com/fabric.js"></a>
        <noscript>
            <a href="http://flattr.com/thing/391332/Fabric-js" target="_blank">
                <img src="http://api.flattr.com/button/flattr-badge-large.png" alt="Flattr this" title="Flattr this" border="0" />
            </a>
        </noscript>
    </li>-->

</ul>

<script>
    (function () {

        if (document.location.hostname === 'localhost') {
            var links = document.getElementById('header').getElementsByTagName('a');
            for (var i = 0, len = links.length; i < len; i++) {
                // very retarted fix but fuck it
                links[i].href = links[i].href.replace('fabricjs.com', 'localhost:4000');
            }
        }
        else {
            var s = document.createElement('script'), t = document.getElementsByTagName('script')[0];
            s.async = true;
            s.src = 'http://api.flattr.com/js/0.6/load.js?mode=auto';
            t.parentNode.insertBefore(s, t);

            !function (d, s, id) {
                var js, fjs = d.getElementsByTagName(s)[0];
                if (!d.getElementById(id)) {
                    js = d.createElement(s);
                    js.id = id;
                    js.src = "//platform.twitter.com/widgets.js";
                    fjs.parentNode.insertBefore(js, fjs);
                }
            }(document, "script", "twitter-wjs");
        }


    })();
</script>


<div id="bd-wrapper" ng-controller="CanvasControls">


    <style>
        #setControlVisible {
            margin-top: -10px;
        }

        #setControlVisible input {
            margin: 0;
        }
    </style>
    <div position="absolute" left="10%" top="15%">
        <canvas id="c" width="1000" height="500"></canvas>
    </div>
    <div style="display: inline-block;position:absolute;top:8.5%;right:3%; background: #f5f2f0; padding: 0 10px; margin-top: .5em; margin-left: 10px; margin-right: -5px">
        <p>
            <label>
                <input type="checkbox" id="hasControls" checked>
                <code>hasControls</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="hasBorders" checked>
                <code>hasBorders</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="hasRotatingPoint" checked>
                <code>hasRotatingPoint</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="visible" checked>
                <code>visible</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="selectable" checked>
                <code>selectable</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="evented" checked>
                <code>evented</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="transparentCorners">
                <code>transparentCorners</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="centeredScaling">
                <code>centeredScaling</code>
            </label>
        </p>
        <p>
            <label>
                <input type="checkbox" id="centeredRotation">
                <code>centeredRotation</code>
            </label>
        </p>
        <p>
            <label>
                <code>padding</code>
                <input type="range" id="padding" value="0" min="0" max="50" style="display: block">
            </label>
        </p>
        <p>
            <label>
                <code>cornerSize</code>
                <input type="range" id="cornerSize" value="12" min="1" max="50" style="display: block">
            </label>
        </p>
        <p>
            <label>
                <code>rotatingPointOffset</code>
                <input type="range" id="rotatingPointOffset" value="40" min="5" max="150" style="display: block">
            </label>
        </p>
        <p>
            <code>setControlVisible</code>
        <p id="setControlVisible">
            <label>
                <input type="checkbox" title="top-left control" name="tl" checked>
            </label>
            <label>
                <input type="checkbox" title="middle-left control" name="ml" checked>
            </label>
            <label>
                <input type="checkbox" title="bottom-left control" name="bl" checked>
            </label>
            <label>
                <input type="checkbox" title="middle-bottom control" name="mb" checked>
            </label>
            <label>
                <input type="checkbox" title="bottom-right control" name="br" checked>
            </label>
            <label>
                <input type="checkbox" title="middle-right control" name="mr" checked>
            </label>
            <label>
                <input type="checkbox" title="top-right control" name="tr" checked>
            </label>
            <label>
                <input type="checkbox" title="middle-top control" name="mt" checked>
            </label>
            <label>
                <input type="checkbox" title="middle-top-rotate control" name="mtr" checked>
            </label>
        </p>
        </p>
        <p>
            <label>
                <code>borderColor</code>
                <input type="color" id="borderColor" style="display: block">
            </label>
        </p>
        <p>
            <label>
                <code>cornerColor</code>
                <input type="color" id="cornerColor" style="display: block">
            </label>
        </p>
    </div>


    <style>
        .controls { display: inline-block; background: #fafafa; margin-left: 10px; padding: 15px; border-left: 1px dotted #aaa; }
        .canvas-container { display: inline-block; vertical-align: top; }
        input[disabled] { opacity: 0.5; }
        #bd-wrapper { min-width: 1600px; }
    </style>

    <div class="controls">
        <h3>Filters:</h3>
        <p>
            <label><span>Grayscale:</span> <input type="checkbox" id="grayscale" disabled></label>
        </p>
        <p>
            <label><span>Invert:</span> <input type="checkbox" id="invert" disabled></label>
        </p>
        <p>
            <label><span>Sepia:</span> <input type="checkbox" id="sepia" disabled></label>
        </p>
        <p>
            <label><span>Sepia2:</span> <input type="checkbox" id="sepia2" disabled></label>
        </p>
        <p>
            <label><span>Remove white:</span> <input type="checkbox" id="remove-white" disabled></label>
            <br>
            <label>Threshold: <input type="range" id="remove-white-threshold" value="60" min="0" max="255" disabled></label>
            <br>
            <label>Distance: <input type="range" id="remove-white-distance" value="10" min="0" max="255" disabled></label>
        </p>
        <p>
            <label><span>Brightness:</span> <input type="checkbox" id="brightness" disabled></label>
            <br>
            <label>Value: <input type="range" id="brightness-value" value="100" min="-255" max="255" disabled></label>
        </p>
        <p>
            <label><span>Contrast:</span> <input type="checkbox" id="contrast" disabled></label>
            <br>
            <label>Value: <input type="range" id="contrast-value" value="0" min="-255" max="255" disabled></label>
        </p>
        <p>
            <label><span>Saturate:</span> <input type="checkbox" id="saturate" disabled></label>
            <br>
            <label>Value: <input type="range" id="saturate-value" value="100" min="-100" max="100" disabled></label>
        </p>
        <p>
            <label><span>Noise:</span> <input type="checkbox" id="noise" disabled></label>
            <br>
            <label>Value: <input type="range" id="noise-value" value="100" min="0" max="1000" disabled></label>
        </p>
        <p>
            <label><span>GradientTransparency:</span> <input type="checkbox" id="gradient-transparency" disabled></label>
            <br>
            <label>Value: <input type="range" id="gradient-transparency-value" value="100" min="0" max="255" disabled></label>
        </p>
        <p>
            <label><span>Pixelate</span> <input type="checkbox" id="pixelate" disabled></label>
            <br>
            <label>Value: <input type="range" id="pixelate-value" value="4" min="2" max="20" disabled></label>
        </p>
        <p>
            <label><span>Blur:</span> <input type="checkbox" id="blur" disabled></label>
        </p>
        <p>
            <label><span>Sharpen:</span> <input type="checkbox" id="sharpen" disabled></label>
        </p>
        <p>
            <label><span>Emboss:</span> <input type="checkbox" id="emboss" disabled></label>
        </p>
        <p>
            <label><span>Tint:</span> <input type="checkbox" id="tint" disabled></label><br>
            <label>Color: <input type="color" id="tint-color" value=""></label><br>
            <label>Opacity: <input type="range" id="tint-opacity" min="0" max="1" value="1" step="0.1"></label><br>
        </p>
        <p>
            <label><span>Multiply:</span> <input type="checkbox" id="multiply" disabled></label><br>
            <label>Color: <input type="color" id="multiply-color" value=""></label><br>
        </p>
        <p>
            <label><span>Blend:</span> <input type="checkbox" id="blend" disabled></label>
            <br>
            <label>Mode:</label>
            <select id="blend-mode" name="blend-mode">
                <option selected value="add">Add</option>
                <option value="diff">Diff</option>
                <option value="subtract">Subtract</option>
                <option value="multiply">Multiply</option>
                <option value="screen">Screen</option>
                <option value="lighten">Lighten</option>
                <option value="darken">Darken</option>
            </select>
            <br>
            <label>Color: <input type="color" id="blend-color" value="#00f900"></label><br>
        </p>
    </div>
    
    <script id="main">(function () {
        var canvas = this.__canvas = new fabric.Canvas('c');
        var $ = function(id){return document.getElementById(id)};

        fabric.Image.fromURL('/resources/assets/printio.png', function (img) {
            img.width = 200;
            img.height=200;
            canvas.add(img).setActiveObject(img);
        })


        function observeBoolean(property) {
            document.getElementById(property).onclick = function () {
                canvas.item(0)[property] = this.checked;
                canvas.renderAll();
            };
        }

        function applyFilter(index, filter) {
            var obj = canvas.getActiveObject();
            obj.filters[index] = filter;
            obj.applyFilters(canvas.renderAll.bind(canvas));
        }


        function applyFilterValue(index, prop, value) {
            var obj = canvas.getActiveObject();
            if (obj.filters[index]) {
                obj.filters[index][prop] = value;
                obj.applyFilters(canvas.renderAll.bind(canvas));
            }
        }

            f = fabric.Image.filters;

        canvas.on({
            'object:selected': function() {
                fabric.util.toArray(document.getElementsByTagName('input'))
                    .forEach(function(el){ el.disabled = false; })

                var filters = ['grayscale', 'invert', 'remove-white', 'sepia', 'sepia2',
                    'brightness', 'contrast', 'saturate', 'noise', 'gradient-transparency', 'pixelate',
                    'blur', 'sharpen', 'emboss', 'tint', 'multiply', 'blend'];

                for (var i = 0; i < filters.length; i++) {
                    $(filters[i]).checked = !!canvas.getActiveObject().filters[i];
                }
            },
            'selection:cleared': function() {
                fabric.util.toArray(document.getElementsByTagName('input'))
                    .forEach(function(el){ el.disabled = true; })
            }
        });



        function observeNumeric(property) {
            document.getElementById(property).onchange = function () {
                canvas.item(0)[property] = this.value;
                canvas.renderAll();
            };
        }

        function observeOptionsList(property) {
            var list = document.querySelectorAll('#' + property +
                ' [type="checkbox"]');
            for (var i = 0, len = list.length; i < len; i++) {
                list[i].onchange = function () {
                    canvas.item(0)[property](this.name, this.checked);
                    canvas.renderAll();
                };
            }
            ;
        }

        var indexF;
        $('grayscale').onclick = function() {
            applyFilter(0, this.checked && new f.Grayscale());
        };
        $('invert').onclick = function() {
            applyFilter(1, this.checked && new f.Invert());
        };
        $('remove-white').onclick = function () {
            applyFilter(2, this.checked && new f.RemoveWhite({
                    threshold: $('remove-white-threshold').value,
                    distance: $('remove-white-distance').value
                }));
        };
        $('remove-white-threshold').onchange = function() {
            applyFilterValue(2, 'threshold', this.value);
        };
        $('remove-white-distance').onchange = function() {
            applyFilterValue(2, 'distance', this.value);
        };
        $('sepia').onclick = function() {
            applyFilter(3, this.checked && new f.Sepia());
        };
        $('sepia2').onclick = function() {
            applyFilter(4, this.checked && new f.Sepia2());
        };
        $('brightness').onclick = function () {
            applyFilter(5, this.checked && new f.Brightness({
                    brightness: parseInt($('brightness-value').value, 10)
                }));
        };
        $('brightness-value').onchange = function() {
            applyFilterValue(5, 'brightness', parseInt(this.value, 10));
        };
        $('contrast').onclick = function () {
            applyFilter(6, this.checked && new f.Contrast({
                    contrast: parseInt($('contrast-value').value, 10)
                }));
        };
        $('contrast-value').onchange = function() {
            applyFilterValue(6, 'contrast', parseInt(this.value, 10));
        };
        $('saturate').onclick = function () {
            applyFilter(7, this.checked && new f.Saturate({
                    saturate: parseInt($('saturate-value').value, 10)
                }));
        };
        $('saturate-value').onchange = function() {
            applyFilterValue(7, 'saturate', parseInt(this.value, 10));
        };
        $('noise').onclick = function () {
            applyFilter(8, this.checked && new f.Noise({
                    noise: parseInt($('noise-value').value, 10)
                }));
        };
        $('noise-value').onchange = function() {
            applyFilterValue(8, 'noise', parseInt(this.value, 10));
        };
        $('gradient-transparency').onclick = function () {
            applyFilter(9, this.checked && new f.GradientTransparency({
                    threshold: parseInt($('gradient-transparency-value').value, 10)
                }));
        };
        $('gradient-transparency-value').onchange = function() {
            applyFilterValue(9, 'threshold', parseInt(this.value, 10));
        };
        $('pixelate').onclick = function() {
            applyFilter(10, this.checked && new f.Pixelate({
                    blocksize: parseInt($('pixelate-value').value, 10)
                }));
        };
        $('pixelate-value').onchange = function() {
            applyFilterValue(10, 'blocksize', parseInt(this.value, 10));
        };
        $('blur').onclick = function() {
            applyFilter(11, this.checked && new f.Convolute({
                    matrix: [ 1/9, 1/9, 1/9,
                        1/9, 1/9, 1/9,
                        1/9, 1/9, 1/9 ]
                }));
        };
        $('sharpen').onclick = function() {
            applyFilter(12, this.checked && new f.Convolute({
                    matrix: [  0, -1,  0,
                        -1,  5, -1,
                        0, -1,  0 ]
                }));
        };
        $('emboss').onclick = function() {
            applyFilter(13, this.checked && new f.Convolute({
                    matrix: [ 1,   1,  1,
                        1, 0.7, -1,
                        -1,  -1, -1 ]
                }));
        };
        $('tint').onclick = function() {
            applyFilter(14, this.checked && new f.Tint({
                    color: document.getElementById('tint-color').value,
                    opacity: parseFloat(document.getElementById('tint-opacity').value)
                }));
        };
        $('tint-color').onchange = function() {
            applyFilterValue(14, 'color', this.value);
        };
        $('tint-opacity').onchange = function() {
            applyFilterValue(14, 'opacity', parseFloat(this.value));
        };
        $('multiply').onclick = function() {
            applyFilter(15, this.checked && new f.Multiply({
                    color: document.getElementById('multiply-color').value
                }));
        };
        $('multiply-color').onchange = function() {
            applyFilterValue(15, 'color', this.value);
        };

        $('blend').onclick= function() {
            applyFilter(16, this.checked && new f.Blend({
                    color: document.getElementById('blend-color').value,
                    mode: document.getElementById('blend-mode').value
                }));
        };

        $('blend-mode').onchange = function() {
            applyFilterValue(16, 'mode', this.value);
        };

        $('blend-color').onchange = function() {
            applyFilterValue(16, 'color', this.value);
        };

        observeBoolean('hasControls');
        observeBoolean('hasBorders');
        observeBoolean('hasRotatingPoint');
        observeBoolean('visible');
        observeBoolean('selectable');
        observeBoolean('evented');
        observeBoolean('transparentCorners');
        observeBoolean('centeredScaling');
        observeBoolean('centeredRotation');

        observeNumeric('padding');
        observeNumeric('cornerSize');
        observeNumeric('rotatingPointOffset');
        observeNumeric('borderColor');
        observeNumeric('cornerColor');

        observeOptionsList('setControlVisible');
    })();
    </script>

</div>


<script>
    (function () {
        fabric.util.addListener(fabric.window, 'load', function () {
            var canvas = this.__canvas || this.canvas,
                canvases = this.__canvases || this.canvases;

            canvas && canvas.calcOffset && canvas.calcOffset();

            if (canvases && canvases.length) {
                for (var i = 0, len = canvases.length; i < len; i++) {
                    canvases[i].calcOffset();
                }
            }
        });
    })();
</script>



</body>
</html>
