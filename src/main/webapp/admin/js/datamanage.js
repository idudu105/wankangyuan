/* 
* @Author: Marte
* @Date:   2018-05-09 14:46:55
* @Last Modified by:   Marte
* @Last Modified time: 2018-05-10 11:11:59
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


    // 新增metainfo
    var atableeditzadd=odatacollec.querySelectorAll('.tableeditzadd');//新增metainfo按钮
    var oaddbiaoxK=odatacollec.querySelectorAll('.addbiaoxK')[0];//新增metainfo框
    var oaddbiaoxTx=oaddbiaoxK.querySelectorAll('.addbiaoxTx')[0];//新增metainfo框关闭按钮
    var oaddbiaoxBb=oaddbiaoxK.querySelectorAll('.addbiaoxBb')[0];//新增metainfo框提交按钮
    var oaddbiaoxBb2=oaddbiaoxK.querySelectorAll('.addbiaoxBb2')[0];//新增metainfo框关闭按钮2
    var aaddbiaoxlik=oaddbiaoxK.querySelectorAll('.addbiaoxlik');//新增metainfo框名称框

    var oaddbiaoxPD=0;


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
    var atableeditzedit=odatacollec.querySelectorAll('.tableeditzedit');//更新metainfo按钮
    var oaddbiaoxK2=odatacollec.querySelectorAll('.addbiaoxK2')[0];//更新metainfo框
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
    var atableeditzdel=odatacollec.querySelectorAll('.tableeditzdel');//删除metainfo按钮
    var odelbiaoxK=odatacollec.querySelectorAll('.delbiaoxK')[0];//删除metainfo框
    console.log(odelbiaoxK)
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
    var odatacollec=document.querySelectorAll('.datacollec')[0];//数据采集表
    var abox_xytabz=odatacollec.querySelectorAll('.box_xytabz');//三（多）个表

    console.log(abox_xytabz);
    for(var a=0;a<abox_xytabz.length;a++){
        (function(i){
            var oquanxuan=abox_xytabz[i].querySelectorAll('.quanxuan')[0];//每个表的全选
            // console.log(oquanxuan);
            var axuanze=abox_xytabz[i].querySelectorAll('.xuanze');//每个表的选择

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
                    console.log(2);
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
    var odatatypeconfig=document.querySelectorAll('.datatypeconfig')[0];//格式化数据类型配置表

    // 新增格式化数据类型
    var otableeditzadd=odatatypeconfig.querySelectorAll('.tableeditzadd')[0];//新增格式化数据类型按钮
    var oaddbiaoxK_=odatatypeconfig.querySelectorAll('.addbiaoxK')[0];//新增格式化数据类型框
    var oaddbiaoxTx=oaddbiaoxK_.querySelectorAll('.addbiaoxTx')[0];//新增格式化数据类型框关闭按钮
    var oaddbiaoxBb=oaddbiaoxK_.querySelectorAll('.addbiaoxBb')[0];//新增格式化数据类型框提交按钮
    var oaddbiaoxBb2=oaddbiaoxK_.querySelectorAll('.addbiaoxBb2')[0];//新增格式化数据类型框关闭按钮2
    var aaddbiaoxlik=oaddbiaoxK_.querySelectorAll('.addbiaoxlik');//新增格式化数据类型框名称框

    var oaddbiaoxPD_=0;


    otableeditzadd.onclick=function(){
        if(oaddbiaoxPD_==0){
            oaddbiaoxK_.style.display="block";
            oaddbiaoxPD_=1;
            for(var j=0;j<aaddbiaoxlik.length;j++){
                aaddbiaoxlik[j].value="";
            }
        }
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
    var otableeditzedit=odatatypeconfig.querySelectorAll('.tableeditzedit')[0];//更新格式化数据类型按钮
    var oaddbiaoxK_2=odatatypeconfig.querySelectorAll('.addbiaoxK2')[0];//更新格式化数据类型框
    // console.log(oaddbiaoxK2);
    var oaddbiaoxTx=oaddbiaoxK_2.querySelectorAll('.addbiaoxTx')[0];//更新格式化数据类型框关闭按钮
    var oaddbiaoxBb=oaddbiaoxK_2.querySelectorAll('.addbiaoxBb')[0];//更新格式化数据类型框提交按钮
    var oaddbiaoxBb2=oaddbiaoxK_2.querySelectorAll('.addbiaoxBb2')[0];//更新格式化数据类型框关闭按钮2
    var aaddbiaoxlik=oaddbiaoxK_2.querySelectorAll('.addbiaoxlik');//更新格式化数据类型框名称框

    var oaddbiaoxPD_2=0;


    otableeditzedit.onclick=function(){
        if(oaddbiaoxPD_2==0){
            oaddbiaoxK_2.style.display="block";
            oaddbiaoxPD_2=1;
            for(var j=0;j<aaddbiaoxlik.length;j++){
                aaddbiaoxlik[j].value="";
            }
        }
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
    var otableeditzdel=odatatypeconfig.querySelectorAll('.tableeditzdel')[0];//删除格式化数据类型按钮
    var odelbiaoxK_=odatatypeconfig.querySelectorAll('.delbiaoxK')[0];//删除格式化数据类型框
    var oaddbiaoxTx=odelbiaoxK_.querySelectorAll('.addbiaoxTx')[0];//删除格式化数据类型框关闭按钮
    var oaddbiaoxBb2=odelbiaoxK_.querySelectorAll('.addbiaoxBb2')[0];//删除格式化数据类型框关闭按钮2
    var oaddbiaoxBb=odelbiaoxK_.querySelectorAll('.addbiaoxBb')[0];//删除格式化数据类型框提交按钮

    var oaddbiaoxPD_3=0;

    otableeditzdel.onclick=function(){
        if(oaddbiaoxPD_3==0){
            odelbiaoxK_.style.display="block";
            oaddbiaoxPD_3=1;
        }
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


    // 格式化数据类型配置表全选效果
    var odatatypeconfig=document.querySelectorAll('.datatypeconfig')[0];//格式化数据类型配置表
    var obox_xytabz=odatatypeconfig.querySelectorAll('.box_xytabz')[0];//表格


    var oquanxuan2=obox_xytabz.querySelectorAll('.quanxuan')[0];//全选框
    var axuanze2=obox_xytabz.querySelectorAll('.xuanze');//复选框

    var afuxuan2=[];
    console.log(oquanxuan2)
    console.log(axuanze2)

    for(var i=0;i<axuanze2.length;i++){
        afuxuan2.push(axuanze2[i]);
    }

    oquanxuan2.onchange=function(){
        if(oquanxuan2.checked){
            for(var i=0;i<axuanze2.length;i++){
                afuxuan2[i].checked=1;
            }
        }else{
            console.log(2);
            for(var i=0;i<axuanze2.length;i++){
                afuxuan2[i].checked=0;
            }
        }
    }

    for(var i=0;i<axuanze2.length;i++){
        (function(index){
            axuanze2[i].onchange=function(){
                var fuxuanPD=0;
                for(var j=0;j<axuanze2.length;j++){
                    if(afuxuan2[j].checked){
                        fuxuanPD++;
                    }
                    console.log(afuxuan2[j].checked);
                }
                console.log(fuxuanPD);
                if(fuxuanPD==axuanze2.length){
                    oquanxuan2.checked=1;
                }else if(fuxuanPD!=axuanze2.length){
                    oquanxuan2.checked=0;
                }
            }
        })(i)
    }

});