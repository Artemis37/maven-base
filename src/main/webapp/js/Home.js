document.querySelector('.plus-circle').addEventListener('mouseenter', () => {
    document.querySelector('.plus-circle svg').style.transform = 'translateX(15px) scale(1.4)'
})
document.querySelector('.plus-circle').addEventListener('mouseleave', () => {
    document.querySelector('.plus-circle svg').style.transform = 'translateX(15px) scale(1.0)'
})  

document.addEventListener('DOMContentLoaded', function() {
   if(window.location.pathname === '/java_base/') {
        document.querySelectorAll('.sidebar-item')[0].classList.add('sidebar-item-active')
    }
}, false);
