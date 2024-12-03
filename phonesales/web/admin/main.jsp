<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %> 
<%
String path1 = request.getContextPath();
%>
<!DOCTYPE HTML>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=path1 %>/admin/css/vendors.css">
<link rel="stylesheet" type="text/css" href="<%=path1 %>/admin/css/vertical-menu.css">
<link rel="stylesheet" type="text/css" href="<%=path1 %>/admin/css/bootstrap-extended.css">
 <title></title>

  </head> 
  <body>
    <div class="content-wrapper">
      <div class="content-header ">
        <div class="content-header-left mb-2">
          <h3 class="content-header-title mb-0">首页</h3>
        </div>
      </div>
      <div class="content-body">
		  <div class="row clearfix">
          <div class="col-lg-3 col-md-6 col-xs-12">
            <div class="card">
              <div class="card-content">
                <div class="media align-items-stretch">
                  <div class="p-2 text-center bg-primary bg-darken-2">
                    <i class="fa fa-area-chart font-large-2 white"></i>
                  </div>
                  <div class="p-2 bg-gradient-x-primary white media-body">
                    <h5>未发货订单数量</h5>
                    <h5 class="text-bold-400 mb-0">${ordercount}</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>

		  
		  
      </div>
    </div>
	

  <script src="<%=path1 %>/js/vendors.min.js" type="text/javascript"></script>
  <script src="<%=path1 %>/js/app-menu.js" type="text/javascript"></script>
  <script src="<%=path1 %>/js/app.js" type="text/javascript"></script>
  <script src="<%=path1 %>/js/echarts.min.js" type="text/javascript"></script>
<script>

	
	 $(function () {
setTimeout(function(){ 
	echarts_1();
 	echarts_2();
}, 500);

		 
 	function echarts_1() {
 		var myChart = echarts.init(document.getElementById('echart1'));

 		option = {
   	tooltip: {
		trigger: 'axis',
		axisPointer: {
			lineStyle: {
				color: '#57617B'
			}
		}
	},
    "legend": {
		
      "data": [
		{"name": "数量"},
        {"name": "金额"},
      ],
      "top": "0%",
      "textStyle": {
       "color": "#666"//图例文字
      }
    },
	
    "xAxis": [
      {
        "type": "category",
		boundaryGap: false,//
        data: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月'],
		 axisLine: { lineStyle: {color: "#eee"}},
        axisLabel:  { textStyle: {color: "r#666", fontSize: '14', },
            },
		
        },
	],
    "yAxis": [
      {
        "type": "value",
        "name": "数量「单」",
		  "nameTextStyle": {color: '#666',},
        "min": 0,
     //  "max": 15,
        //"interval": 5,
		    //splitNumber:3,
        "axisLabel": {
          "show": true,
         
        },
        axisLine: {lineStyle: {color: '#eee'}},//左线色
        axisLabel: {textStyle: {color: '#666'}},
		    splitLine: {show:false,lineStyle: {color:"#eee"}},//x轴线
      },
      {
		      "min": 0,
      // "max": 15,
        "type": "value",
        "name": "金额「元」",
		//  splitNumber:3,
		  "nameTextStyle": {color: '#666',},
        "show": true,
        "axisLabel": {
          "show": true,
        
        },
		  axisLine: {lineStyle: {color: '#ddd'}},//右线色
		   splitLine: {show:true,lineStyle: {color:"#eee"}},//x轴线
		   axisLabel: {textStyle: {color: '#666'}},
      },
    ],
    "grid": {
      "top": "10%",
		"right":"30",
		"bottom":"30",
		"left":"30",
    },
    "series": [
      {
        "name": "数量",
		 type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
            normal: {
				color: 'rgba(0,0,0,.0)',
                width: 0
            }
        },
        areaStyle: {
            normal: {
                color:'rgba(255,106,125,.5)',
              
            }
        },
			itemStyle: {
			normal: {
			  color:'rgba(255,106,125,.5)',
			}
		},
        "data": [1,3,2,9,3,8,4,6,2,7,2,4],
       
      },
    
      {
        "name": "金额",
        "type": "line",
        "yAxisIndex": 1,
		  smooth: true,
        symbol: 'circle',
        symbolSize: 5,
		showSymbol: false,
        "data": [4,3,5,3,11,4,7, 3,4,2,7,3],
		   lineStyle: {
            normal: {
				color: 'rgba(0,0,0,.0)',
                width: 0
            }
        },
		  areaStyle: {
            normal: {
                 color:"rgba(255,158,114,.5)"
            }
        },
        "itemStyle": {
          "normal": {
           color:"rgba(255,158,114,.5)"
			 
          }
        },
      
      }
    ]
};
      

 		// 使用刚指定的配置项和数据显示图表。
 		myChart.setOption(option);
 		window.addEventListener("resize", function () {
 			myChart.resize();
 		});
 	}
		 function echarts_2() {
 		var myChart = echarts.init(document.getElementById('echart2'));

 		option = {
   	tooltip: {
		trigger: 'axis',
		axisPointer: {
			lineStyle: {
				color: '#57617B'
			}
		}
	},
    "legend": {
		
      "data": [
		{"name": "数量"},
        {"name": "金额"},
      ],
      "top": "0%",
      "textStyle": {
       "color": "#666"//图例文字
      }
    },
	
    "xAxis": [
      {
        "type": "category",
		boundaryGap: false,//
        data: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六', '星期日'],
		 axisLine: { lineStyle: {color: "#eee"}},
        axisLabel:  { textStyle: {color: "r#666", fontSize: '14', },
            },
		
        },
	],
    "yAxis": [
      {
        "type": "value",
        "name": "数量「单」",
		  "nameTextStyle": {color: '#666',},
        "min": 0,
     //  "max": 15,
        //"interval": 5,
		    //splitNumber:3,
        "axisLabel": {
          "show": true,
         
        },
        axisLine: {lineStyle: {color: '#eee'}},//左线色
        axisLabel: {textStyle: {color: '#666'}},
		    splitLine: {show:false,lineStyle: {color:"#eee"}},//x轴线
      },
      {
		      "min": 0,
      // "max": 15,
        "type": "value",
        "name": "金额「元」",
		//  splitNumber:3,
		  "nameTextStyle": {color: '#666',},
        "show": true,
        "axisLabel": {
          "show": true,
        
        },
		  axisLine: {lineStyle: {color: '#ddd'}},//右线色
		   splitLine: {show:true,lineStyle: {color:"#eee"}},//x轴线
		   axisLabel: {textStyle: {color: '#666'}},
      },
    ],
    "grid": {
      "top": "10%",
		"right":"30",
		"bottom":"30",
		"left":"30",
    },
    "series": [
      {
        "name": "数量",
		 type: 'line',
        smooth: true,
        symbol: 'circle',
        symbolSize: 5,
        showSymbol: false,
        lineStyle: {
            normal: {
				color: 'rgba(0,0,0,.0)',
                width: 0
            }
        },
        areaStyle: {
            normal: {
                color:'rgba(255,106,125,.5)',
              
            }
        },
			itemStyle: {
			normal: {
			  color:'rgba(255,106,125,.5)',
			}
		},
        "data": [1,3,2,9,4,5,3],
       
      },
    
      {
        "name": "金额",
		
        "type": "line",
        "yAxisIndex": 1,
		  smooth: true,
        symbol: 'circle',
        symbolSize: 5,
		showSymbol: false,
        "data": [4,1,5,3,8,2,3],
		   lineStyle: {
            normal: {
				color: 'rgba(0,0,0,.0)',
                width: 0
            }
        },
		  areaStyle: {
            normal: {
                color:"rgba(255,158,114,.5)"
            }
        },
        "itemStyle": {
          "normal": {
             color:"rgba(255,158,114,.5)"
			 
          }
        },
      
      }
    ]
};
      

 		// 使用刚指定的配置项和数据显示图表。
 		myChart.setOption(option);
 		window.addEventListener("resize", function () {
 			myChart.resize();
 		});
 	}
 })

	</script>
</body>
</html>
