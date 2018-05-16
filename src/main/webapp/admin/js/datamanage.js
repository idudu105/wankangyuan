/* 
* @Author: Marte
* @Date:   2018-05-09 14:46:55
* @Last Modified by:   Marte
* @Last Modified time: 2018-05-16 00:02:19
*/

$(document).ready(function(){

    // 数据采集源选项卡切换

    var odatacollec=document.querySelectorAll('.datacollec')[0];//数据采集表

    var obox_xxtab=odatacollec.querySelectorAll('.box_xxtab')[0];
    var abox_xxtabz=obox_xxtab.querySelectorAll('.box_xxtabz');
    var obox_addxxtabz=obox_xxtab.querySelectorAll('.box_addxxtabz')[0];

    var obox_xytab=odatacollec.querySelectorAll('.box_xytab')[0];
    var abox_xytabz=obox_xytab.querySelectorAll('.box_xytabz');

    for(var i=0;i<abox_xxtabz.length;i++){
        (function(index){
            abox_xxtabz[index].onclick=function(){
                for(var j=0;j<abox_xytabz.length;j++){
                    abox_xytabz[j].className="box_xytabz";
                }
                abox_xytabz[index].className="box_xytabz active";
            }
        })(i)
    }

    // 新增数据采集源
    var obox_addxxtabz=odatacollec.querySelectorAll('.box_addxxtabz')[0];//新增数据采集源按钮
    var oaddboxK=odatacollec.querySelectorAll('.addboxK')[0];//新增数据采集源框
    var oaddboxTx=oaddboxK.querySelectorAll('.addboxTx')[0];//新增数据采集源框关闭按钮
    var oaddboxBb=oaddboxK.querySelectorAll('.addboxBb')[0];//新增数据采集源框提交按钮
    var oaddboxlik=oaddboxK.querySelectorAll('.addboxlik')[0];//新增数据采集源框名称框

    var oaddboxPD=0;

    obox_addxxtabz.onclick=function(){
        if(oaddboxPD==0){
            oaddboxK.style.display="block";
            oaddboxPD=1;
            oaddboxlik.value="";
        }
    }
    oaddboxTx.onclick=function(){
            oaddboxK.style.display="none";
            oaddboxPD=0;
    }
    oaddboxBb.onclick=function(){
            // alert("提交成功")
            oaddboxK.style.display="none";
            oaddboxPD=0;
    }


   
    var abox_xytabzK=document.querySelectorAll('.box_xytabzK');//metainfo配置表
    // console.log(abox_xytabzK);
 // 新增metainfo
    var atableeditzadd=[];
    for(var i=0;i<abox_xytabzK.length;i++){
        var otableeditzadd=abox_xytabzK[i].querySelectorAll('.tableeditzadd')[0];
        // console.log(otableeditzadd)
        atableeditzadd.push(otableeditzadd);//新增metainfo按钮
    }
    // console.log(atableeditzadd);
    // var atableeditzadd=obox_xytabzK.querySelectorAll('.tableeditzadd');//新增metainfo按钮
    var oaddbiaoxK=document.querySelectorAll('.addbiaoxK')[0];//新增metainfo框
    var oaddbiaoxTx=oaddbiaoxK.querySelectorAll('.addbiaoxTx')[0];//新增metainfo框关闭按钮
    var oaddbiaoxBb=oaddbiaoxK.querySelectorAll('.addbiaoxBb')[0];//新增metainfo框提交按钮
    var oaddbiaoxBb2=oaddbiaoxK.querySelectorAll('.addbiaoxBb2')[0];//新增metainfo框关闭按钮2
    var aaddbiaoxlik=oaddbiaoxK.querySelectorAll('.addbiaoxlik');//新增metainfo框名称框

    var oaddbiaoxPD=0;

    // console.log(oaddbiaoxK);


    for(var i=0;i<atableeditzadd.length;i++){
        (function(index){
            atableeditzadd[index].onclick=function(){
                if(oaddbiaoxPD==0){
                    oaddbiaoxK.style.display="block";
                    oaddbiaoxPD=1;
                    for(var j=0;j<aaddbiaoxlik.length;j++){
                        aaddbiaoxlik[j].value="";
                    }
                }
            }
        })(i)
    }
    
    oaddbiaoxTx.onclick=function(){
            oaddbiaoxK.style.display="none";
            oaddbiaoxPD=0;
    }
    oaddbiaoxBb2.onclick=function(){
            oaddbiaoxK.style.display="none";
            oaddbiaoxPD=0;
    }
    oaddbiaoxBb.onclick=function(){
            // alert("提交成功")
            oaddbiaoxK.style.display="none";
            oaddbiaoxPD=0;
    }


    // 更新metainfo
    var atableeditzedit=[];
    for(var i=0;i<abox_xytabzK.length;i++){
        var otableeditzedit=abox_xytabzK[i].querySelectorAll('.tableeditzedit')[0];
        // console.log(otableeditzedit);
        atableeditzedit.push(otableeditzedit);//新增metainfo按钮
    }
    // console.log(atableeditzedit);


    // var atableeditzedit=obox_xytabzK.querySelectorAll('.tableeditzedit');//更新metainfo按钮
    var oaddbiaoxK2=document.querySelectorAll('.addbiaoxK2')[0];//更新metainfo框
    var oaddbiaoxTx=oaddbiaoxK2.querySelectorAll('.addbiaoxTx')[0];//更新metainfo框关闭按钮
    var oaddbiaoxBb=oaddbiaoxK2.querySelectorAll('.addbiaoxBb')[0];//更新metainfo框提交按钮
    var oaddbiaoxBb2=oaddbiaoxK2.querySelectorAll('.addbiaoxBb2')[0];//更新metainfo框关闭按钮2
    var aaddbiaoxlik=oaddbiaoxK2.querySelectorAll('.addbiaoxlik');//更新metainfo框名称框

    var oaddbiaoxPD2=0;


    for(var i=0;i<atableeditzedit.length;i++){
        (function(index){
            atableeditzedit[index].onclick=function(){
                if(oaddbiaoxPD2==0){
                    oaddbiaoxK2.style.display="block";
                    oaddbiaoxPD2=1;
                    for(var j=0;j<aaddbiaoxlik.length;j++){
                        aaddbiaoxlik[j].value="";
                    }
                }
            }
        })(i)
    }
    
    oaddbiaoxTx.onclick=function(){
            oaddbiaoxK2.style.display="none";
            oaddbiaoxPD2=0;
    }
    oaddbiaoxBb2.onclick=function(){
            oaddbiaoxK2.style.display="none";
            oaddbiaoxPD2=0;
    }
    oaddbiaoxBb.onclick=function(){
            // alert("提交成功")
            oaddbiaoxK2.style.display="none";
            oaddbiaoxPD2=0;
    }


    // 删除metainfo
    var atableeditzdel=[];
    for(var i=0;i<abox_xytabzK.length;i++){
        var otableeditzdel=abox_xytabzK[i].querySelectorAll('.tableeditzdel')[0];
        // console.log(otableeditzdel);
        atableeditzdel.push(otableeditzdel);//新增metainfo按钮
    }


    // var atableeditzdel=obox_xytabzK.querySelectorAll('.tableeditzdel');//删除metainfo按钮
    var odelbiaoxK=document.querySelectorAll('.delbiaoxK')[0];//删除metainfo框
    // console.log(odelbiaoxK);
    var oaddbiaoxTx=odelbiaoxK.querySelectorAll('.addbiaoxTx')[0];//删除metainfo框关闭按钮
    var oaddbiaoxBb2=odelbiaoxK.querySelectorAll('.addbiaoxBb2')[0];//删除metainfo框关闭按钮2
    var oaddbiaoxBb=odelbiaoxK.querySelectorAll('.addbiaoxBb')[0];//删除metainfo框提交按钮

    var oaddbiaoxPD3=0;

    for(var i=0;i<atableeditzdel.length;i++){
        (function(index){
            atableeditzdel[index].onclick=function(){
                if(oaddbiaoxPD3==0){
                    odelbiaoxK.style.display="block";
                    oaddbiaoxPD3=1;
                }
            }
        })(i)
    }

    oaddbiaoxTx.onclick=function(){
            odelbiaoxK.style.display="none";
            oaddbiaoxPD3=0;
    }
    oaddbiaoxBb2.onclick=function(){
            odelbiaoxK.style.display="none";
            oaddbiaoxPD3=0;
    }
    oaddbiaoxBb.onclick=function(){
            // alert("提交成功")
            odelbiaoxK.style.display="none";
            oaddbiaoxPD3=0;
    }



    //数据采集表的全选效果
    // var odatacollec=document.querySelectorAll('.datacollec')[0];//数据采集表
    // var abox_xytabz=odatacollec.querySelectorAll('.box_xytabz');//三（多）个表

    var abox_xytabzK=document.querySelectorAll('.box_xytabzK');//三个数据采集表
    console.log(abox_xytabzK);

    // console.log(abox_xytabz);
    for(var a=0;a<abox_xytabzK.length;a++){
        (function(i){
            var oquanxuan=abox_xytabzK[i].querySelectorAll('.quanxuan')[0];//每个表的全选
            // console.log(oquanxuan);
            var axuanze=abox_xytabzK[i].querySelectorAll('.xuanze');//每个表的选择

            var afuxuan=[];
            for(var i=0;i<axuanze.length;i++){
                afuxuan.push(axuanze[i]);
            }

            oquanxuan.onchange=function(){
                if(oquanxuan.checked){
                    for(var i=0;i<axuanze.length;i++){
                        afuxuan[i].checked=1;
                    }
                }else{
                    // console.log(2);
                    for(var i=0;i<axuanze.length;i++){
                        afuxuan[i].checked=0;
                    }
                }
            }

            for(var i=0;i<axuanze.length;i++){
                (function(index){
                    axuanze[i].onchange=function(){
                        var fuxuanPD=0;
                        for(var j=0;j<axuanze.length;j++){
                            if(afuxuan[j].checked){
                                fuxuanPD++;
                            }
                            console.log(afuxuan[j].checked);
                        }
                        console.log(fuxuanPD);
                        if(fuxuanPD==axuanze.length){
                            oquanxuan.checked=1;
                        }else if(fuxuanPD!=axuanze.length){
                            oquanxuan.checked=0;
                        }
                    }
                })(i)
            }
        })(a)

    }



    //格式化数据类型配置表

    var abox_xytabzK2=document.querySelectorAll('.box_xytabzK2');//格式化数据类型配置表
    // console.log(abox_xytabzK2);


// 新增格式化数据类型
    var atableeditzadd2=[];
    for(var i=0;i<abox_xytabzK2.length;i++){
        var otableeditzadd=abox_xytabzK2[i].querySelectorAll('.tableeditzadd')[0];
        // console.log(otableeditzadd)
        atableeditzadd2.push(otableeditzadd);//新增metainfo按钮
    }
    // console.log(atableeditzadd2);

    
    // var otableeditzadd=obox_xytabzK2.querySelectorAll('.tableeditzadd')[0];//新增格式化数据类型按钮
    var oaddbiaoxK_=document.querySelectorAll('.addbiaoxK_2')[0];//新增格式化数据类型框
    var oaddbiaoxTx=oaddbiaoxK_.querySelectorAll('.addbiaoxTx')[0];//新增格式化数据类型框关闭按钮
    var oaddbiaoxBb=oaddbiaoxK_.querySelectorAll('.addbiaoxBb')[0];//新增格式化数据类型框提交按钮
    var oaddbiaoxBb2=oaddbiaoxK_.querySelectorAll('.addbiaoxBb2')[0];//新增格式化数据类型框关闭按钮2
    var aaddbiaoxlik=oaddbiaoxK_.querySelectorAll('.addbiaoxlik');//新增格式化数据类型框名称框

    var oaddbiaoxPD_=0;


    for(var i=0;i<atableeditzadd2.length;i++){
        (function(index){
            atableeditzadd2[index].onclick=function(){
                if(oaddbiaoxPD_==0){
                    oaddbiaoxK_.style.display="block";
                    oaddbiaoxPD_=1;
                }
            }
        })(i)
    }

    
    oaddbiaoxTx.onclick=function(){
            oaddbiaoxK_.style.display="none";
            oaddbiaoxPD_=0;
    }
    oaddbiaoxBb2.onclick=function(){
            oaddbiaoxK_.style.display="none";
            oaddbiaoxPD_=0;
    }
    oaddbiaoxBb.onclick=function(){
            // alert("提交成功")
            oaddbiaoxK_.style.display="none";
            oaddbiaoxPD_=0;
    }


    // 更新格式化数据类型
    var atableeditzedit2=[];
    for(var i=0;i<abox_xytabzK2.length;i++){
        var otableeditzedit=abox_xytabzK2[i].querySelectorAll('.tableeditzedit')[0];
        // console.log(otableeditzadd)
        atableeditzedit2.push(otableeditzedit);//新增metainfo按钮
    }
    // console.log(atableeditzadd2);

    // var otableeditzedit=obox_xytabzK2.querySelectorAll('.tableeditzedit')[0];//更新格式化数据类型按钮
    var oaddbiaoxK_2=document.querySelectorAll('.addbiaoxK2_2')[0];//更新格式化数据类型框
    // console.log(oaddbiaoxK2);
    var oaddbiaoxTx=oaddbiaoxK_2.querySelectorAll('.addbiaoxTx')[0];//更新格式化数据类型框关闭按钮
    var oaddbiaoxBb=oaddbiaoxK_2.querySelectorAll('.addbiaoxBb')[0];//更新格式化数据类型框提交按钮
    var oaddbiaoxBb2=oaddbiaoxK_2.querySelectorAll('.addbiaoxBb2')[0];//更新格式化数据类型框关闭按钮2
    var aaddbiaoxlik=oaddbiaoxK_2.querySelectorAll('.addbiaoxlik');//更新格式化数据类型框名称框

    var oaddbiaoxPD_2=0;


    for(var i=0;i<atableeditzedit2.length;i++){
        (function(index){
            atableeditzedit2[index].onclick=function(){
                if(oaddbiaoxPD_2==0){
                    oaddbiaoxK_2.style.display="block";
                    oaddbiaoxPD_2=1;
                }
            }
        })(i)
    }

    
    oaddbiaoxTx.onclick=function(){
            oaddbiaoxK_2.style.display="none";
            oaddbiaoxPD_2=0;
    }
    oaddbiaoxBb2.onclick=function(){
            oaddbiaoxK_2.style.display="none";
            oaddbiaoxPD_2=0;
    }
    oaddbiaoxBb.onclick=function(){
            // alert("提交成功")
            oaddbiaoxK_2.style.display="none";
            oaddbiaoxPD_2=0;
    }


    // 删除格式化数据类型
    var atableeditzdel2=[];
    for(var i=0;i<abox_xytabzK2.length;i++){
        var otableeditzdel=abox_xytabzK2[i].querySelectorAll('.tableeditzdel')[0];
        // console.log(otableeditzadd)
        atableeditzdel2.push(otableeditzdel);//新增metainfo按钮
    }
    // console.log(atableeditzdel2);
    
    
    // var otableeditzdel=obox_xytabzK2.querySelectorAll('.tableeditzdel')[0];//删除格式化数据类型按钮
    var odelbiaoxK_=document.querySelectorAll('.delbiaoxK_2')[0];//删除格式化数据类型框
    var oaddbiaoxTx=odelbiaoxK_.querySelectorAll('.addbiaoxTx')[0];//删除格式化数据类型框关闭按钮
    var oaddbiaoxBb2=odelbiaoxK_.querySelectorAll('.addbiaoxBb2')[0];//删除格式化数据类型框关闭按钮2
    var oaddbiaoxBb=odelbiaoxK_.querySelectorAll('.addbiaoxBb')[0];//删除格式化数据类型框提交按钮

    var oaddbiaoxPD_3=0;

    for(var i=0;i<atableeditzdel2.length;i++){
        (function(index){
            atableeditzdel2[index].onclick=function(){
                if(oaddbiaoxPD_3==0){
                    odelbiaoxK_.style.display="block";
                    oaddbiaoxPD_3=1;
                }
            }
        })(i)
    }


    oaddbiaoxTx.onclick=function(){
            odelbiaoxK_.style.display="none";
            oaddbiaoxPD_3=0;
    }
    oaddbiaoxBb2.onclick=function(){
            odelbiaoxK_.style.display="none";
            oaddbiaoxPD_3=0;
    }
    oaddbiaoxBb.onclick=function(){
            // alert("提交成功")
            odelbiaoxK_.style.display="none";
            oaddbiaoxPD_3=0;
    }


    // // 格式化数据类型配置表全选效果
    // var odatatypeconfig=document.querySelectorAll('.datatypeconfig')[0];//格式化数据类型配置表
    // var obox_xytabz=odatatypeconfig.querySelectorAll('.box_xytabz')[0];//表格
    
    var abox_xytabzK2=document.querySelectorAll('.box_xytabzK2');//三个数据采集表
    console.log(abox_xytabzK2);



    for(var a=0;a<abox_xytabzK2.length;a++){
        (function(i){
            var oquanxuan=abox_xytabzK2[i].querySelectorAll('.quanxuan')[0];//每个表的全选
            // console.log(oquanxuan);
            var axuanze=abox_xytabzK2[i].querySelectorAll('.xuanze');//每个表的选择

            var afuxuan=[];
            for(var i=0;i<axuanze.length;i++){
                afuxuan.push(axuanze[i]);
            }

            oquanxuan.onchange=function(){
                if(oquanxuan.checked){
                    for(var i=0;i<axuanze.length;i++){
                        afuxuan[i].checked=1;
                    }
                }else{
                    // console.log(2);
                    for(var i=0;i<axuanze.length;i++){
                        afuxuan[i].checked=0;
                    }
                }
            }

            for(var i=0;i<axuanze.length;i++){
                (function(index){
                    axuanze[i].onchange=function(){
                        var fuxuanPD=0;
                        for(var j=0;j<axuanze.length;j++){
                            if(afuxuan[j].checked){
                                fuxuanPD++;
                            }
                            console.log(afuxuan[j].checked);
                        }
                        console.log(fuxuanPD);
                        if(fuxuanPD==axuanze.length){
                            oquanxuan.checked=1;
                        }else if(fuxuanPD!=axuanze.length){
                            oquanxuan.checked=0;
                        }
                    }
                })(i)
            }
        })(a)

    }

    var abiaoxiangthin=document.querySelectorAll('.biaoxiangthin');//进入按钮

    var oendconfigK=document.querySelectorAll('.endconfigK')[0];//配置结果类型框
    var oendconfigTx=oendconfigK.querySelectorAll('.endconfigTx')[0];//配置结果类型框关闭按钮
    
    for(var i=0;i<abiaoxiangthin.length;i++){
        (function(index){
            abiaoxiangthin[index].onclick=function(){
                oendconfigK.style.display="block";
            }
        })(i)
    }
    oendconfigTx.onclick=function(){
        oendconfigK.style.display="none";
    }


//metainfo表
    var oendconfigz1=document.querySelectorAll('.endconfigz1')[0];
    var oencozadd=oendconfigz1.querySelectorAll('.encozadd')[0];//新增metainfo按钮
    var oenco1aK=oendconfigz1.querySelectorAll('.enco1aK')[0];//新增metainfo框
    var oendconfigTx=oenco1aK.querySelectorAll('.endconfigTx')[0];//新增metainfo框关闭按钮
    var oencob=oenco1aK.querySelectorAll('.encob')[0];//新增metainfo框提交按钮

    oencozadd.onclick=function(){
        oenco1aK.style.display="block";
    }
    oendconfigTx.onclick=function(){
        oenco1aK.style.display="none";
    }


    var oencozedit=oendconfigz1.querySelectorAll('.encozedit')[0];//更新metainfo按钮
    var oenco1eK=oendconfigz1.querySelectorAll('.enco1eK')[0];//更新metainfo框
    var oendconfigTx=oenco1eK.querySelectorAll('.endconfigTx')[0];//更新metainfo框关闭按钮
    var oencob=oenco1eK.querySelectorAll('.encob')[0];//更新metainfo框提交按钮

    oencozedit.onclick=function(){
        oenco1eK.style.display="block";
    }
    oendconfigTx.onclick=function(){
        oenco1eK.style.display="none";
    }

    var oencozdel=oendconfigz1.querySelectorAll('.encozdel')[0];//删除metainfo按钮
    var oenco1dK=oendconfigz1.querySelectorAll('.enco1dK')[0];//删除metainfo框
    var oendconfigTx=oenco1dK.querySelectorAll('.endconfigTx')[0];//删除metainfo框关闭按钮
    var oencob=oenco1dK.querySelectorAll('.encob')[0];//删除metainfo框提交按钮
    var oencob2=oenco1dK.querySelectorAll('.encob2')[0];//删除metainfo框关闭按钮2

    oencozdel.onclick=function(){
        oenco1dK.style.display="block";
    }
    oendconfigTx.onclick=function(){
        oenco1dK.style.display="none";
    }
    oencob2.onclick=function(){
        oenco1dK.style.display="none";
    }

//metainfo表全选
    var oquanxuan3=oendconfigz1.querySelectorAll('.quanxuan')[0];//全选
    var axuanze3=oendconfigz1.querySelectorAll('.xuanze');//复选
    console.log(oquanxuan3);
    console.log(axuanze3);

    oquanxuan3.onchange=function(){
        if(oquanxuan3.checked){
            for(var i=0;i<axuanze3.length;i++){
                axuanze3[i].checked=1;
            }
        }else{
            // console.log(2);
            for(var i=0;i<axuanze3.length;i++){
                axuanze3[i].checked=0;
            }
        }
    }

    for(var i=0;i<axuanze3.length;i++){
        (function(index){
            axuanze3[i].onchange=function(){
                var fuxuanPD=0;
                for(var j=0;j<axuanze3.length;j++){
                    if(axuanze3[j].checked){
                        fuxuanPD++;
                    }
                    console.log(axuanze3[j].checked);
                }
                console.log(fuxuanPD);
                if(fuxuanPD==axuanze3.length){
                    oquanxuan3.checked=1;
                }else if(fuxuanPD!=axuanze3.length){
                    oquanxuan3.checked=0;
                }
            }
        })(i)
    }







//data表
    var oendconfigz2=document.querySelectorAll('.endconfigz2')[0];
    var oencozadd=oendconfigz2.querySelectorAll('.encozadd')[0];//新增metainfo按钮
    var oenco2aK=oendconfigz2.querySelectorAll('.enco2aK')[0];//新增metainfo框
    var oendconfigTx=oenco2aK.querySelectorAll('.endconfigTx')[0];//新增metainfo框关闭按钮
    var oencob=oenco2aK.querySelectorAll('.encob')[0];//新增metainfo框提交按钮

    oencozadd.onclick=function(){
        oenco2aK.style.display="block";
    }
    oendconfigTx.onclick=function(){
        oenco2aK.style.display="none";
    }


    var oencozedit=oendconfigz2.querySelectorAll('.encozedit')[0];//更新metainfo按钮
    var oenco2eK=oendconfigz2.querySelectorAll('.enco2eK')[0];//更新metainfo框
    var oendconfigTx=oenco2eK.querySelectorAll('.endconfigTx')[0];//更新metainfo框关闭按钮
    var oencob=oenco2eK.querySelectorAll('.encob')[0];//更新metainfo框提交按钮

    oencozedit.onclick=function(){
        oenco2eK.style.display="block";
    }
    oendconfigTx.onclick=function(){
        oenco2eK.style.display="none";
    }

    var oencozdel=oendconfigz2.querySelectorAll('.encozdel')[0];//删除metainfo按钮
    var oenco2dK=oendconfigz2.querySelectorAll('.enco2dK')[0];//删除metainfo框
    var oendconfigTx=oenco2dK.querySelectorAll('.endconfigTx')[0];//删除metainfo框关闭按钮
    var oencob=oenco2dK.querySelectorAll('.encob')[0];//删除metainfo框提交按钮
    var oencob2=oenco2dK.querySelectorAll('.encob2')[0];//删除metainfo框关闭按钮2

    oencozdel.onclick=function(){
        oenco2dK.style.display="block";
    }
    oendconfigTx.onclick=function(){
        oenco2dK.style.display="none";
    }
    oencob2.onclick=function(){
        oenco2dK.style.display="none";
    }
      
//data表全选
    var oquanxuan4=oendconfigz2.querySelectorAll('.quanxuan')[0];//全选
    var axuanz4=oendconfigz2.querySelectorAll('.xuanze');//复选
    console.log(oquanxuan4);
    console.log(axuanz4);

    oquanxuan4.onchange=function(){
        if(oquanxuan4.checked){
            for(var i=0;i<axuanz4.length;i++){
                axuanz4[i].checked=1;
            }
        }else{
            // console.log(2);
            for(var i=0;i<axuanz4.length;i++){
                axuanz4[i].checked=0;
            }
        }
    }

    for(var i=0;i<axuanz4.length;i++){
        (function(index){
            axuanz4[i].onchange=function(){
                var fuxuanPD=0;
                for(var j=0;j<axuanz4.length;j++){
                    if(axuanz4[j].checked){
                        fuxuanPD++;
                    }
                    console.log(axuanz4[j].checked);
                }
                console.log(fuxuanPD);
                if(fuxuanPD==axuanz4.length){
                    oquanxuan4.checked=1;
                }else if(fuxuanPD!=axuanz4.length){
                    oquanxuan4.checked=0;
                }
            }
        })(i)
    }


});