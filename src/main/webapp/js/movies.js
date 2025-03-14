$(document).ready(() => {
    $('#hamburger-menu').click(() => {
        $('#hamburger-menu').toggleClass('active')
        $('#nav-menu').toggleClass('active')
    })

    // setting owl carousel

    let navText = ["<i class='bx bx-chevron-left'></i>", "<i class='bx bx-chevron-right'></i>"]

    $('#hero-carousel').owlCarousel({
        items: 1,
        dots: false,
        loop: true,
        nav:true,
        navText: navText,
        autoplay: true,
        autoplayHoverPause: true
    })

    $('#top-movies-slide').owlCarousel({
        items: 2,
        dots: false,
        loop: true,
        autoplay: true,
        autoplayHoverPause: true,
        responsive: {
            500: {
                items: 3
            },
            1280: {
                items: 4
            },
            1600: {
                items: 6
            }
        }
    })

    $('.movies-slide').owlCarousel({
        items: 2,
        dots: false,
        nav:true,
        navText: navText,
        margin: 15,
        responsive: {
            500: {
                items: 2
            },
            1280: {
                items: 4
            },
            1600: {
                items: 6
            }
        }
    })
})


// script.js
document.addEventListener('DOMContentLoaded', function() {
    // Navigation link hover effect
    const navLinks = document.querySelectorAll('.nav-link');
    
    navLinks.forEach(link => {
        // Set active class based on current page
        if (link.getAttribute('href') === window.location.pathname) {
            link.classList.add('active');
        }
        
        // Optional: Add hover sound effect
        link.addEventListener('mouseenter', () => {
            // You can add a hover sound effect here
            console.log('Link hovered');
        });
    });
    
    // User profile dropdown
    const userProfile = document.querySelector('.user-profile');
    userProfile.addEventListener('click', () => {
        // Add your dropdown menu toggle logic here
        console.log('User profile clicked');
    });
    
    // Notification button
    const notificationBtn = document.querySelector('.notification-btn');
    notificationBtn.addEventListener('click', () => {
        // Add your notification panel toggle logic here
        console.log('Notification button clicked');
    });
});