// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require Chart.min
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap-sprockets

function smoothScroll(tar, duration){
  let target = document.querySelector(tar);
  let targetPos = target.getBoundingClientRect().top;
  let startPos = window.pageYOffset;
  let distance = targetPos - startPos;
  let startTime = null;

  function animation(currentTime){
    if(startTime === null) startTime = currentTime;
    let timeElapsed = currentTime - startTime;
    let run = ease(timeElapsed, startPos, distance, duration);
    window.scrollTo(0, run);
    if (timeElapsed < duration) requestAnimationFrame(animation);
  }

  function ease(t, b, c, d){
    t /= d /2;
    if (t < 1) return c / 2 * t * t + b;
    t--;
    return -c / 2 *(t * (t - 2) - 1) + b;
  }

  requestAnimationFrame(animation);
}

document.addEventListener('DOMContentLoaded', ()=>{
  let desktop_nav = document.querySelector('#nav-scroll');
  let mobile_nav = document.querySelectorAll('.navbar-default-mobile');
  window.addEventListener('scroll', () => {
    if(window.pageYOffset > 50){
      desktop_nav.classList.add('scrolled');
      for (let i = 0; i <= mobile_nav-1; i++) {
        mobile_nav[i].classList.add('mobile-scrolled');
      }
    }
    else {
      desktop_nav.classList.remove('scrolled');
      for (let i = 0; i <= mobile_nav-1; i++) {
        mobile_nav[i].classList.remove('mobile-scrolled');
      }
    }
  });

    if(location.pathname != '/index' && location.pathname != '/'){
        const nav = document.querySelectorAll("nav");
        for(let i = 0;i<=nav.length-1;i++){
            nav[i].setAttribute("style","background-color: #212529; opacity: 0.7;");
        }
    }
    else {
      //desktop
      document.querySelector('#search-desktop').addEventListener('click', () => {smoothScroll("#search-desktop-target", 1000)});
      document.querySelector('#timeline-desktop').addEventListener('click', () => {smoothScroll("#timeline-desktop-target", 1000)});
      //tablet
      document.querySelector('#search-tablet').addEventListener('click', () => {smoothScroll("#search-tablet-target", 1000)});
      document.querySelector('#timeline-tablet').addEventListener('click', () => {smoothScroll("#timeline-tablet-target", 1000)});
      //mobile
      document.querySelector('#search-mobile').addEventListener('click', () => {smoothScroll("#search-mobile-target", 1000)});
      document.querySelector('#timeline-mobile').addEventListener('click', () => {smoothScroll("#timeline-mobile-target", 1000)});
    }
    const menus = document.querySelectorAll('.menu-icon');
    const men = document.querySelectorAll('.meniu');
    for(let i = 0; i<=menus.length-1;i++){
        menus[i].addEventListener('click', ()=>{
            menus[i].classList.toggle('active');
            men[i].classList.toggle('show');
        });
    }

});

function area(canvasId, labels, pm10, pm25) {
  var ctx = document.getElementById(canvasId).getContext('2d');
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: labels,
        datasets: [
        {
            label: "PM10",
            data: pm10,
            backgroundColor: [
                'rgba(255, 99, 132, 0)',
            ],
            borderColor: [
                'rgba(230, 25, 75,1)',
            ],
            borderWidth: 2,
            fill: false
        },
        {
            label: "PM2.5",
            data: pm25,
            backgroundColor: [
                'rgba(54, 162, 235, 0)',
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
            ],
            borderWidth: 2,
            fill: false
        },
        {
            label: 'Wartość dopuszczalna PM10 [50ug/m3]',
            data: [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50],
            backgroundColor: [
                // 'rgba(255, 99, 132, 0.1)',
                // 'rgba(54, 162, 235, 0.2)',
                // 'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0)'

            ],
            borderColor: [
              'rgba(230, 25, 75,1)'
            ],
            borderWidth: 1,
            pointRadius: 0
        },
        {
            label: 'Wartość dopuszczalna PM2.5 [25ug/m3]',
            data: [25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25, 25],
            backgroundColor: [
                // 'rgba(255, 99, 132, 0.1)',
                // 'rgba(54, 162, 235, 0.2)',
                // 'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0)'

            ],
            borderColor: [
              'rgba(54, 162, 235, 1)',
            ],
            borderWidth: 1,
            pointRadius: 0
        }
      ]
    },
    options: {
        scales: {
            yAxes: [{
                scaleLabel: {
                  display: true,
                  labelString: '[ug/m3]'
                },
                ticks: {
                    beginAtZero:true
                },

            }],
            xAxes: [
            {
              scaleLabel: {
                display: true,
                labelString: 'godziny'
              },
            }
            ],
        },
        legend: {
          position:'top'
        }
    }
  });
}

function live(mes, canvasId) {
  console.log(arguments);
  const datasets = [];
  for (let i = 2; i < mes.length; i+=2) {
    let color = 'rgba(' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ',' + (Math.floor(Math.random() * 256)) + ', 1)';
    let obj =  {
      label: mes[i],
      data: mes[i+1],
      // hidden: i<7 ? false : true,
      hidden: false,
      backgroundColor: [
          'rgba(0,0,0,0)',
      ],
      borderColor: [
          color,
      ],
      borderWidth: 1,
      fill: false
    }
    datasets.push(obj)
  }


  let pm10 = {
      label: '100% wg WHO',
      data: [50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50, 50],
      backgroundColor: [
          'rgba(255, 99, 132, 0.1)'
      ],
      borderColor: [
          'rgba(255,99,132,1)'
      ],
      borderWidth: 1,
      pointRadius: 0
  }
  datasets.push(pm10);

  // console.log(datasets);

  var ctx = canvasId;
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: mes[1],
        datasets: datasets
    },
    options: {
        scales: {
            yAxes: [{
                scaleLabel: {
                  display: true,
                  labelString: 'ug/m3'
                },
                ticks: {
                    beginAtZero:true
                },

            }],
            xAxes: [
            {
              scaleLabel: {
                display: true,
                labelString: 'godziny'
              },
            }
            ],
        },
        legend: {
          position:'right'
        }
    }
  });
}
