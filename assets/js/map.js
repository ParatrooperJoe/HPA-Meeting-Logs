var map;
jQuery(document).ready(function(){

    map = new GMaps({
        div: '#map',
        lat: 34.984160,
        lng: -82.021957,
    });
    map.addMarker({
        lat: 34.984160,
        lng: -82.021957,
        title: 'Address',      
        infoWindow: {
            content: '<h5 class="title">AIT Enterprises</h5><p><span class="region">PO BOX 130 Spartanburg, SC </span><br><span class="postal-code">29303</span><br><span class="country-name">USA</span></p>'
        }
        
    });

});