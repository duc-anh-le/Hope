<%-- 
    Document   : header-bottom1
    Created on : Jun 27, 2023, 2:36:14 PM
    Author     : dinhg
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <div class="header-bottom">
        <div id="carouselExampleControls" class="carousel slide max-h-70 min-h-70" data-bs-ride="carousel">
            <div class="carousel-inner max-h-80 min-h-80 transition-shadow">
                <div class="carousel-item active transition-transform">
                    <img src="images/banner-1.png" class="object-contain w-full px-4" alt="banner-1">
                </div>
                <div class="carousel-item transition-transform">
                    <img src="images/banner-2.png" class="object-contain w-full px-4" alt="banner-2">
                </div>
                <div class="carousel-item transition-transform">
                    <img src="images/banner-3.png" class="object-contain w-full px-4" alt="banner-3">
                </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.5.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
                // Enable carousel auto-sliding
                var carousel = new bootstrap.Carousel(document.getElementById('carouselExampleControls'), {
                    interval: 1800, // Change slide every 3 seconds (3000ms)
                    pause: 'hover' // Pause slide when hovering over the carousel
                });
            </script>
        </div>
    </div>
</html>
