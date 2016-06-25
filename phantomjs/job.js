var page = require('webpage').create();

page.viewportSize = {width: 1024, height: 768};



page.open('http://bing.com', function () {
    /* This will set the page background color white */
        page.evaluate(function() {
        document.body.bgColor = '#FFFFFF';
    });
    
    page.render('test.jpg');
    phantom.exit();
});
