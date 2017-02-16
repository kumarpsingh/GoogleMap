<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GoogleMap.aspx.cs" Inherits="GoogleMap.GoogleMap" %>
<!DOCTYPE html>
<html>
<head>

    <title>Google Maps Delhi</title>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDd9CJIX8piu3vNaHksOyrqoaKGE-zA1AQ&v=3&sensor=false" type="text/javascript"></script>
</head>
<body>
    <div id="map" style="height: 600px; width: 1100px;"></div>
    <script type="text/javascript">

        var locations = [
                 ['<div>Kamla Nagar</div>', 28.6809, 77.2046],
                 ['<div>Roop Nagear</div>', 28.68865, 77.21365]
        ];
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 14,
                    scrollwheel: true,
                    center: new google.maps.LatLng(28.6809, 77.2046),
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                });
                var infowindow = new google.maps.InfoWindow();
                var marker, i;
                for (i = 0; i < locations.length; i++) {
                    marker = new google.maps.Marker({
                        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                        map: map
                    });
                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent(locations[i][0]);
                            infowindow.open(map, marker);
                        }
                    })(marker, i));
                }
    </script>
</body>
</html>
