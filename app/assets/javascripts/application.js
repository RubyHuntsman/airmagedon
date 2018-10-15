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
//= require turbolinks
//= require Chart.min
//= require_tree .


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

function dx() {
	console.log("xd2")
}