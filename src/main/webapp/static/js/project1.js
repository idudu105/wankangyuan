/* 
* @Author: Marte
* @Date:   2018-04-23 15:32:03
* @Last Modified by:   Marte
* @Last Modified time: 2018-05-14 16:37:11
*/


//  项目0
function project0(){
    var obox=document.querySelectorAll('.box')[0];
    obox.style.minHeight=window.screen.availHeight-200+'px';
    console.log(document.body.clientWidth);

// 全选框和复选框的动作
    if(document.querySelectorAll('.quanxuanK')[0]){
        oquanxuanK=document.querySelectorAll('.quanxuanK')[0];
        var oquanxuan=oquanxuanK.querySelectorAll('.input_check')[0];

        var afuxuan=[];
        var afuxuanK=[];

        if(document.querySelectorAll('.fuxuanK2')[0]){
            afuxuanK=document.querySelectorAll('.fuxuanK2');
            console.log("k2");
        }else if(document.querySelectorAll('.fuxuanK3')[0]){
            afuxuanK=document.querySelectorAll('.fuxuanK3');
            console.log("k3");
        }

        if(afuxuanK[0]){
            for(var i=0;i<afuxuanK.length;i++){
                afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
            }
        }
        

        oquanxuanK.onchange=function(){
            if(oquanxuan.checked){
                for(var i=0;i<afuxuanK.length;i++){
                    afuxuan[i].checked=1;
                }
            }else{
                console.log(2);
                for(var i=0;i<afuxuanK.length;i++){
                    afuxuan[i].checked=0;
                }
            }
        }


        if(afuxuanK[0]){
            for(var i=0;i<afuxuanK.length;i++){
                (function(index){
                    afuxuanK[i].onchange=function(){
                        var fuxuanPD=0;
                        for(var j=0;j<afuxuanK.length;j++){
                            if(afuxuan[j].checked){
                                fuxuanPD++;
                            }
                            console.log(afuxuan[j].checked);
                        }
                        console.log(fuxuanPD);
                        if(fuxuanPD==afuxuanK.length){
                            oquanxuan.checked=1;
                        }else if(fuxuanPD!=afuxuanK.length){
                            oquanxuan.checked=0;
                        }
                    }
                })(i)
            }
        }
        
    }else{
        console.log(222);
    }
}

//  项目1
function project1(){

// 筛选菜单框显示隐藏
    var oshaixuanBT=document.querySelectorAll('.shaixuanBT')[0];//获取筛选下拉按钮
    var oshaixuanZK=document.querySelectorAll('.shaixuanZK')[0];//获取筛选菜单
    var shaixuanPD=0;

    oshaixuanBT.onclick=function(event){
        if(shaixuanPD==0){
            oshaixuanZK.className="shaixuanZK active";
            shaixuanPD=1;
        }else{
            oshaixuanZK.className="shaixuanZK";
            shaixuanPD=0;
        }
        // event.stopPropagation();
        // console.log(1);
    }
    // document.onclick=function(){
    //     oshaixuanZK.className="shaixuanZK";
    // }

//筛选按钮显示隐藏选项
    var oshaixuanZK=document.querySelectorAll('.shaixuanZK')[0];//获取筛选菜单
    var ashaixuanZKliI=document.querySelectorAll('.shaixuanZKliI');//获取所有筛选按钮
    var oPJList=document.querySelectorAll('.PJList')[0];//项目表头栏
    var aPJListli=oPJList.querySelectorAll('.PJListli');//项目表头
    var oPJul=document.querySelectorAll('.PJul')[0];//项目栏
    var aPJli=oPJul.querySelectorAll('.PJli');//每一条项目

    console.log(aPJli);
    

    //初始化筛选按钮判断
    var shaixuanBTPD=new Array();
    for(var i=0;i<ashaixuanZKliI.length;i++){
        shaixuanBTPD[i]=1;
    }



    for(var i=0;i<ashaixuanZKliI.length;i++){
        (function(j){
            ashaixuanZKliI[j].onclick=function(){
                if(shaixuanBTPD[j]==0){
                    ashaixuanZKliI[j].className="shaixuanZKliI active";
                    aPJListli[j].style.display="block";
                    for(var o=0;o<aPJli.length;o++){
                        if(aPJli[o].querySelectorAll('.PJliCli2')[0]){
                            var aPJliCli=aPJli[o].querySelectorAll('.PJliCli2');//格式数据表项
                            aPJliCli[j].style.display="-webkit-box";
                        }else if(aPJli[o].querySelectorAll('.PJliCli')[0]){
                            var aPJliCli=aPJli[o].querySelectorAll('.PJliCli');//项目表项
                            aPJliCli[j].style.display="-webkit-box";
                        }
                    }
                    shaixuanBTPD[j]=1;
                }else{
                    ashaixuanZKliI[j].className="shaixuanZKliI";
                    aPJListli[j].style.display="none";
                    for(var o=0;o<aPJli.length;o++){
                        if(aPJli[o].querySelectorAll('.PJliCli2')[0]){
                            var aPJliCli=aPJli[o].querySelectorAll('.PJliCli2');//格式数据表项
                            aPJliCli[j].style.display="none";
                        }else if(aPJli[o].querySelectorAll('.PJliCli')[0]){
                            var aPJliCli=aPJli[o].querySelectorAll('.PJliCli');//项目表项
                            aPJliCli[j].style.display="none";
                        }
                        
                    }
                    // aPJliCli[j].style.display="none";
                    shaixuanBTPD[j]=0;
                }
                
            }
        })(i)
    }

//项目表头和项目分割线宽度
    var oPJList=document.querySelectorAll('.PJList')[0];//项目表头
    var oPJListline=document.querySelectorAll('.PJListline')[0];//分割线

    oPJListline.style.width=oPJList.offsetWidth*0.98+"px";
    // console.log(oPJListline.offsetWidth);

//点击表头的排序筛选功能
    var oPJK=document.querySelectorAll('.PJK')[0];//项目框
    var oBTSX=document.querySelectorAll('.BTSX')[0];//项目表头筛选框
    var oPJList=document.querySelectorAll('.PJList')[0];//项目表头栏
    var aPJListli=oPJList.querySelectorAll('.PJListli');//项目表头

    var BTSXpd=-1;//项目表头筛选框判断

    //点击设置排序筛选框
    for(var i=0;i<aPJListli.length;i++){
        (function(j){
            aPJListli[j].onclick=function(){
                if(BTSXpd==j){
                    oBTSX.style.display="none";
                    BTSXpd=-1;
                }else{
                    oBTSX.style.display="block";
                    BTSXpd=j;
                }
                var BTSXleft=aPJListli[j].getBoundingClientRect().left;
                if(BTSXleft>1118){
                    BTSXleft=1118;
                }
                oBTSX.style.left=BTSXleft-20+'px'; 
            }
        })(i)
    }
}

//项目切换
function project2(){

}

//  我的项目
function pro_mine(){
    
}

//  创建项目
function pro_create(){
//创建项目
    var opro_create=document.querySelectorAll('.pro_create')[0];//创建项目按钮
    var ocreatePJK=document.querySelectorAll('.createPJK')[0];//创建项目框
    var ocre_PJKtopI=document.querySelectorAll('.cre_PJKtopI')[0];//项目框关闭按钮
    var owidth=document.body.clientWidth;//屏幕宽度
    
    var createPJKpd=0;

    ocre_PJKtopI.onclick=function(){
        if(createPJKpd==1){
            ocreatePJK.style.display="none";
            createPJKpd=0;
        }
    }
    opro_create.onclick=function(){
        if(createPJKpd==0){
            ocreatePJK.style.display="block";
            // alert(ocreatePJK.offsetWidth);
            console.log(owidth/2);
            console.log(ocreatePJK.offsetWidth/2);
            ocreatePJK.style.left=owidth/2-ocreatePJK.offsetWidth/2+"px";//创建框居中
            createPJKpd=1;
        }
    }


}

//创建页面1
function pro_create1(){

//编辑框显示隐藏
    var oPJeditK=document.querySelectorAll('.PJeditK')[0];//编辑框
    var oPJeditX=document.querySelectorAll('.PJeditX')[0];//编辑框关闭按钮
    var aPJedit=document.querySelectorAll('.PJedit');//编辑按钮

    var PJeditpd=0;

    for(var i=0;i<aPJedit.length;i++){
        (function(index){
            aPJedit[index].onclick=function(){
                if(PJeditpd==0){
                    oPJeditK.style.display="block";
                    PJeditpd=1;
                }else{

                }
            }
        })(i)
    }
    oPJeditX.onclick=function(){
        oPJeditK.style.display="none";
        PJeditpd=0;
    }
}

//  公开项目
function pro_public(){

}

// 项目详情
function pro_detail(){
//项目详情右侧banner
    var oprodexqRbK=document.querySelectorAll('.prodexqRbK')[0];//banner图-容器
    var aprodexqRb=oprodexqRbK.querySelectorAll('.prodexqRb');//banner图

    var oprodexqRaK=document.querySelectorAll('.prodexqRaK')[0];//banner按钮-容器
    var aprodexqRa=oprodexqRaK.querySelectorAll('.prodexqRa');//banner按钮

    for(var i=0;i<aprodexqRa.length;i++){
        (function(j){
            aprodexqRa[j].onclick=function(){
                for(var k=0;k<aprodexqRa.length;k++){
                    aprodexqRa[k].className="prodexqRa";
                    aprodexqRb[k].className="prodexqRb";
                }
                aprodexqRa[j].className="prodexqRa active";
                aprodexqRb[j].className="prodexqRb active";
            }
        })(i)
    }




}


// 项目应用结果
function pro_deappendxq(){
// 左侧显示和隐藏
    var osanjiao_left=document.querySelectorAll('.sanjiao_left')[0];//左箭头
    var osanjiao_right=document.querySelectorAll('.sanjiao_right')[0];//右箭头
    var aprodexq2=document.querySelectorAll('.prodexq2');//两种显示方式

    osanjiao_left.onclick=function(){
        aprodexq2[0].className="prodexq2";
        aprodexq2[1].className="prodexq2 active";
    }
    osanjiao_right.onclick=function(){
        aprodexq2[0].className="prodexq2 active";
        aprodexq2[1].className="prodexq2";
    }


}

// 格式数据列表
function pro_dataLB(){

//格式数据列表点击显示隐藏
    var oPJul=document.querySelectorAll('.PJul')[0];//数据列表
    var aPJliC=oPJul.querySelectorAll('.PJliC');//数据列表内数据行
    var aPJliB=oPJul.querySelectorAll('.PJliB');//数据行隐藏栏

    for(var i=0;i<aPJliC.length;i++){
        (function(j){
            aPJliC[j].onclick=function(){
                for(var k=0;k<aPJliB.length;k++){
                    aPJliB[k].className="PJliB";
                }
                aPJliB[j].className="PJliB active";
            }
        })(i)
    }
}



//格式数据
function pro_data(){
// 格式数据树展开收起
    var aPJliBLi=document.querySelectorAll('.PJliBLi');
    for(var i=0;i<aPJliBLi.length;i++){
        (function(j){
            aPJliBLi[j].onclick=function(){
                console.log(this.className);
                if(this.className.indexOf("PJliBLi2")!=-1){
                    this.className="PJliBLi PJliBLi1";
                    var ofufu=this.parentNode.parentNode;
                    var ozizi=ofufu.querySelectorAll('.PJliBR')[0];
                    ozizi.style.display="none";
                }else if(this.className.indexOf("PJliBLi1")){
                    this.className="PJliBLi PJliBLi2";
                    var ofufu=this.parentNode.parentNode;
                    var ozizi=ofufu.querySelectorAll('.PJliBR')[0];
                    ozizi.style.display="inline-block";
                }
            }
        })(i)
    }
}

//点击格式数据
function pro_dataclick(){
// 筛选菜单框显示隐藏
    var oprodaclmRsx=document.querySelectorAll('.prodaclmRsx')[0];//获取筛选下拉按钮
    var oshaixuanZK=document.querySelectorAll('.shaixuanZK')[0];//获取筛选菜单
    var shaixuanPD=0;

    oprodaclmRsx.onclick=function(){
        if(shaixuanPD==0){
            oshaixuanZK.className="shaixuanZK active";
            shaixuanPD=1;
        }else{
            oshaixuanZK.className="shaixuanZK";
            shaixuanPD=0;
        }
        
    }

//

//筛选按钮显示隐藏选项
    var oshaixuanZK=document.querySelectorAll('.shaixuanZK')[0];//获取筛选菜单
    var ashaixuanZKliI=document.querySelectorAll('.shaixuanZKliI');//获取所有筛选按钮
    var oprodaclmRzT=document.querySelectorAll('.prodaclmRzT')[1];//项目表头栏
    var aprodaclmRzTt2=oprodaclmRzT.querySelectorAll('.prodaclmRzTt2');//项目表头
    var oprodaclmRsjK=document.querySelectorAll('.prodaclmRsjK')[0];
    var oprodaclmRzB=oprodaclmRsjK.querySelectorAll('.prodaclmRzB')[0];//项目栏
    var aprodaclmRzBz=oprodaclmRzB.querySelectorAll('.prodaclmRzBz');//每一条项目
    
    console.log(aprodaclmRzTt2);

    //初始化筛选按钮判断
    var shaixuanBTPD=new Array();
    for(var i=0;i<ashaixuanZKliI.length;i++){
        shaixuanBTPD[i]=1;
    }



    for(var i=0;i<ashaixuanZKliI.length;i++){
        (function(j){
            ashaixuanZKliI[j].onclick=function(){
                if(shaixuanBTPD[j]==0){
                    ashaixuanZKliI[j].className="shaixuanZKliI active";
                    aprodaclmRzTt2[j].style.display="block";
                    for(var o=0;o<aprodaclmRzBz.length;o++){
                        var aprodaclmRzTt3=aprodaclmRzBz[o].querySelectorAll('.prodaclmRzTt3');//项目表项
                        aprodaclmRzTt3[j].style.display="block";
                    }
                    shaixuanBTPD[j]=1;
                }else{
                    ashaixuanZKliI[j].className="shaixuanZKliI";
                    aprodaclmRzTt2[j].style.display="none";
                    for(var o=0;o<aprodaclmRzBz.length;o++){
                        var aprodaclmRzTt3=aprodaclmRzBz[o].querySelectorAll('.prodaclmRzTt3');//项目表项
                        aprodaclmRzTt3[j].style.display="none";
                    }
                    shaixuanBTPD[j]=0;
                }
                
            }
        })(i)
    }
}


//文件
function pro_file(){
    var oprof_lbLtRtup=document.querySelectorAll('.prof_lbLtRtup')[0];//文件上传按钮
    var ofileaddK=document.querySelectorAll('.fileaddK')[0]//文件上传框
    var ofileaddTr=document.querySelectorAll('.fileaddTr')[0];//文件上传框关闭按钮
    var owidth=document.body.clientWidth;//屏幕宽度

    var ofileKpd=0;//文件上传框状态判断

    ofileaddTr.onclick=function(){
        if(ofileKpd==1){
            ofileaddK.style.display="none";
            ofileKpd=0;
        }
    }
    oprof_lbLtRtup.onclick=function(){
        if(ofileKpd==0){
            ofileaddK.style.display="block";
            console.log(owidth/2);
            console.log(ofileaddK.offsetWidth/2);
            ofileaddK.style.left=owidth/2-ofileaddK.offsetWidth/2+"px";//创建框居中
            ofileKpd=1;
        }
    }

//文件树
    var oprof_lbLmT=document.querySelectorAll('.prof_lbLmT')[0];
    var aPJliB1L=oprof_lbLmT.querySelectorAll('.PJliB1L');
    var aPJliB2L=oprof_lbLmT.querySelectorAll('.PJliB2L');

    var aPJliBL=[];

    for(var i=0;i<aPJliB1L.length;i++){
        aPJliBL.push(aPJliB1L[i]);
    }
    for(var i=0;i<aPJliB2L.length;i++){
        aPJliBL.push(aPJliB2L[i]);
    }

    console.log(aPJliBL);

    for(var i=0;i<aPJliBL.length;i++){
        (function(index){
            aPJliBL[index].onclick=function(event){
                for(var j=0;j<aPJliBL.length;j++){
                    aPJliBL[j].style.color="#666";
                }
                aPJliBL[index].style.color="#5ca0e5";
                event.stopPropagation();
            }
        })(i)
    }

    oprof_lbLmT.onclick=function(){
        for(var j=0;j<aPJliBL.length;j++){
            aPJliBL[j].style.color="#666";
        }
    }

}

//成员
function pro_member(){

//权限管理框的显示隐藏以及位置
    
    var opro_manGL=document.querySelectorAll('.pro_manGL')[0]//权限管理按钮
    var oQXGLk=document.querySelectorAll('.QXGLk')[0];//权限管理框
    var oQXGLkTr=document.querySelectorAll('.QXGLkTr')[0]//权限管理框关闭按钮

    var QXGLkpd=0;

    oQXGLk.style.left=document.body.clientWidth/2-oQXGLk.offsetWidth/2+'px';

    opro_manGL.onclick=function(){
        if(QXGLkpd){
            oQXGLk.style.display='none';
            QXGLkpd=0;
        }else{
            oQXGLk.style.display="block";
            QXGLkpd=1;
            oQXGLk.style.left=document.body.clientWidth/2-oQXGLk.offsetWidth/2+'px';
        }
    }
    oQXGLkTr.onclick=function(){
        oQXGLk.style.display='none';
        QXGLkpd=0;
    }

// 添加成员框的显示隐藏

    var opro_manadd=document.querySelectorAll('.pro_manadd')[0];//添加成员按钮
    var omemaddK=document.querySelectorAll('.memaddK')[0];//添加成员框
    var omemaddKx=document.querySelectorAll('.memaddKx')[0];//添加成员框关闭按钮

    var memaddKpd=0;

    opro_manadd.onclick=function(){
        if(memaddKpd){
            omemaddK.style.display='none';
            memaddKpd=0;
        }else{
            omemaddK.style.display="block";
            memaddKpd=1;
        }
    }
    omemaddKx.onclick=function(){
        omemaddK.style.display='none';
        memaddKpd=0;
    }

//组织结构树的显示隐藏

    var omimaddMlz1=document.querySelectorAll('.mimaddMlz1')[0];//组织结构树上半
    var amimaddMlz1ZTi=omimaddMlz1.querySelectorAll('.mimaddMlz1ZTi');//组织树圆圈符号
    var amimaddMlz1ZB=omimaddMlz1.querySelectorAll('.mimaddMlz1ZB');//组织树可隐藏模块

    var memaddPD=[];
    for(var i=0;i<amimaddMlz1ZTi.length;i++){
        memaddPD[i]=0;
    }
    console.log(memaddPD);

    for(var i=0;i<amimaddMlz1ZTi.length;i++){
        (function(index){
            amimaddMlz1ZTi[index].onclick=function(){
                if(memaddPD[index]==0){
                    for(var j=0;j<amimaddMlz1ZTi.length;j++){
                        amimaddMlz1ZTi[j].className="mimaddMlz1ZTi";
                        memaddPD[j]=0;
                        amimaddMlz1ZB[j].className="mimaddMlz1ZB";
                    }
                    amimaddMlz1ZTi[index].className="mimaddMlz1ZTi active";
                    amimaddMlz1ZB[index].className="mimaddMlz1ZB active";
                    memaddPD[index]=1;
                }else{
                    amimaddMlz1ZTi[index].className="mimaddMlz1ZTi";
                    memaddPD[index]=0;
                    amimaddMlz1ZB[index].className="mimaddMlz1ZB";
                }
                
            }
        })(i)
    }

}

//讨论版
function pro_discuss(){
    var opaixu=document.querySelectorAll('.paixu')[0];//排序框依据下拉按钮
    var asortZc=opaixu.querySelectorAll('.sortZc');//排序依据下拉按钮
    var asortulK=opaixu.querySelectorAll('.sortulK');//排序下拉框

    var paixuKpd=[];
    for(var i=0;i<asortZc.length;i++){
        paixuKpd[i]=0;
    }

    for(var i=0;i<asortZc.length;i++){
        (function(index){
            asortZc[index].onclick=function(){
                if(paixuKpd[index]==0){
                    for(var j=0;j<asortulK.length;j++){
                        asortulK[j].className="sortulK";
                        paixuKpd[j]=0;
                    }
                    asortulK[index].className='sortulK active';
                    paixuKpd[index]=1;
                }else{
                    asortulK[index].className='sortulK';
                    paixuKpd[index]=0;
                }

            }

        })(i)
    }

//创建框的位置以及显示隐藏效果
    var oaddtheme=document.querySelectorAll('.addtheme')[0];//创建主题按钮
    var othemeadd=document.querySelectorAll('.themeadd')[0];//主题创建框
    var othemeaddX=document.querySelectorAll('.themeaddX')[0];//主题创建框关闭按钮
    var othemeaddMk=document.querySelectorAll('.themeaddMk')[0];//创建框内容
    var othemeaddBc=document.querySelectorAll('.themeaddBc')[0];//创建框取消按钮

    var themeaddPD=0;

    // othemeadd.style.left=document.body.clientWidth/2-othemeadd.offsetWidth/2+"px";

    oaddtheme.onclick=function(){
        if(themeaddPD==0){
            othemeadd.style.display="block";
            // othemeadd.style.left=document.body.clientWidth/2-othemeadd.offsetWidth/2+"px";
            themeaddPD=1;
        }else{
            othemeadd.style.display="none";
            themeaddPD=0;
            othemeaddMk.value="";
        }
    }
    othemeaddX.onclick=function(){
        othemeadd.style.display="none";
        themeaddPD=0;
        othemeaddMk.value="";
    }

    othemeaddBc.onclick=function(){
        othemeadd.style.display="none";
        themeaddPD=0;
        othemeaddMk.value="";
    }

}

//格式数据——我的
function data_mine(){

//格式数据添加至项目框显示隐藏
    var opro_addK=document.querySelectorAll('.pro_addK')[0];//格式数据添加至项目
    var opro_addk=opro_addK.querySelectorAll('.pro_addk')[0];//添加按钮
    var opro_addul=document.querySelectorAll('.pro_addul')[0];//添加项目列表
    var apro_addli=opro_addul.querySelectorAll('.pro_addli');//添加各个项目

    pro_addkPD=0;

    opro_addk.onclick=function(){
        if(pro_addkPD==0){
            opro_addul.style.display="block";
            pro_addkPD=1;
        }else{
            opro_addul.style.display="none";
            pro_addkPD=0;
        }
    }
    for(var i=0;i<apro_addli.length;i++){
        (function(index){
            apro_addli[index].onclick=function(){
                opro_addul.style.display="none";
                pro_addkPD=0;
            }
        })(i)
    }
}


//应用——我的
function app_mine(){

//应用添加至项目框显示隐藏
    var opro_addK=document.querySelectorAll('.pro_addK')[0];//应用添加至项目
    var opro_addk=opro_addK.querySelectorAll('.pro_addk')[0];//添加按钮
    var opro_addul=document.querySelectorAll('.pro_addul')[0];//添加项目列表
    var apro_addli=opro_addul.querySelectorAll('.pro_addli');//添加各个项目

    var oapp_typeK=document.querySelectorAll('.app_typeK')[0];//应用添加至项目
    var oapp_typek=oapp_typeK.querySelectorAll('.app_typek')[0];//添加按钮
    var oapp_typeul=document.querySelectorAll('.app_typeul')[0];//添加项目列表
    var aapp_typeli=oapp_typeul.querySelectorAll('.app_typeli');//添加各个项目

    // pro_addkPD=0;

    opro_addk.onclick=function(event){
        // if(pro_addkPD==0){
            opro_addul.style.display="block";
            opro_addul.style.zIndex+=1;
            oapp_typeul.style.display="none";
        //     pro_addkPD=1;
        // }else{
        //     opro_addul.style.display="none";
        //     pro_addkPD=0;
        // }
        event.stopPropagation();
    }
    for(var i=0;i<apro_addli.length;i++){
        (function(index){
            apro_addli[index].onclick=function(){
                opro_addul.style.display="none";
                // pro_addkPD=0;
            }
        })(i)
    }

//应用类别筛选框显示隐藏
    

    // app_typekPD=0;

    oapp_typek.onclick=function(event){
        // if(app_typekPD==0){
            oapp_typeul.style.display="block";
            oapp_typeul.style.zIndex+=1;
            opro_addul.style.display="none";
        //     app_typekPD=1;
        // }else{
        //     oapp_typeul.style.display="none";
        //     app_typekPD=0;
        // }
        event.stopPropagation();
    }
    for(var i=0;i<aapp_typeli.length;i++){
        (function(index){
            aapp_typeli[index].onclick=function(){
                oapp_typeul.style.display="none";
                // app_typekPD=0;
                console.log(index)
            }
        })(i)
    }

    document.onclick=function(){
        opro_addul.style.display="none";
        // pro_addkPD=0;
        oapp_typeul.style.display="none";
        // app_typekPD=0;
    }
}

function app_public(){
//应用类别筛选框显示隐藏
    var oapp_typeK=document.querySelectorAll('.app_typeK')[0];//应用添加至项目
    var oapp_typek=oapp_typeK.querySelectorAll('.app_typek')[0];//添加按钮
    var oapp_typeul=document.querySelectorAll('.app_typeul')[0];//添加项目列表
    var aapp_typeli=oapp_typeul.querySelectorAll('.app_typeli');//添加各个项目

    // app_typekPD=0;

    oapp_typek.onclick=function(event){
        // if(app_typekPD==0){
            oapp_typeul.style.display="block";
            oapp_typeul.style.zIndex+=1;
        //     app_typekPD=1;
        // }else{
        //     oapp_typeul.style.display="none";
        //     app_typekPD=0;
        // }
        event.stopPropagation();
    }
    for(var i=0;i<aapp_typeli.length;i++){
        (function(index){
            aapp_typeli[index].onclick=function(){
                oapp_typeul.style.display="none";
                // app_typekPD=0;
                console.log(index)
            }
        })(i)
    }

    document.onclick=function(){
        // opro_addul.style.display="none";
        // pro_addkPD=0;
        oapp_typeul.style.display="none";
        // app_typekPD=0;
    }
}

//格式数据——我创建的
function data_create(){
//导入数据框显示隐藏
    var opro_inport=document.querySelectorAll('.pro_inport')[0];//导入数据按钮
    var oinportK=document.querySelectorAll('.inportK')[0];//导入数据框
    var oinportTx=document.querySelectorAll('.inportTx')[0];//导入数据框关闭按钮

    var inportPD=0;

    opro_inport.onclick=function(){
        if(inportPD==0){
            oinportK.style.display="block";
            inportPD=1;
        }else{
            oinportK.style.display="none";
            inportPD=0;
        }
    }
    oinportTx.onclick=function(){
        oinportK.style.display="none";
        inportPD=0;
    }

//导入数据框上传文件
    var oinportMu=document.querySelectorAll('.inportMu')[0];//上传文件按钮
    var oinportMf=document.querySelectorAll('.inportMf')[0];//上传文件input

    oinportMu.onclick=function(){
        oinportMf.click();
    }


//添加源数据
    var opro_adddata=document.querySelectorAll('.pro_adddata')[0];//添加源数据按钮
    var oadddataK=document.querySelectorAll('.adddataK')[0];//添加源数据框
    var oadddataTx=oadddataK.querySelectorAll('.adddataTx')[0];//添加源数据框关闭按钮
    var aadddataMliTT=oadddataK.querySelectorAll('.adddataMliTT');//添加源数据框文本框


    var adddataPD=0;//添加源数据框状态判断

    opro_adddata.onclick=function(){
        if(adddataPD==0){
            oadddataK.style.display="block";
            adddataPD=1;
            for(var i=0;i<aadddataMliTT.length;i++){
                aadddataMliTT[i].value="";//打开添加源数据框的时候清空所有文本框和文本域
            }
        }
    }

    oadddataTx.onclick=function(){
        oadddataK.style.display="none";
        adddataPD=0;
    }


}


//应用-我创建的应用页面
function app_create(){

//应用创建框的显示隐藏
    var opro_createapp=document.querySelectorAll('.pro_createapp')[0];//应用创建按钮
    var ocreateappK=document.querySelectorAll('.createappK')[0];//应用创建框
    var oinportTx=ocreateappK.querySelectorAll('.inportTx')[0];//应用创建框关闭按钮

    var appcreatePD=0;

    opro_createapp.onclick=function(){
        // if(appcreatePD==0){
            ocreateappK.style.display="block";
            appcreatePD=1;
        // }else{
        //     ocreateappK.style.display="none";
        //     appcreatePD=0;
        // }
    }
    oinportTx.onclick=function(){
        ocreateappK.style.display="none";
        appcreatePD=0;
    }



}

//项目应用结果重新运行
function pro_appendre(){
//选择格式数据框显示隐藏
    var aproappendrep=document.querySelectorAll('.proappendrep');//参数框
    var oproreK=document.querySelectorAll('.proreK')[0];//格式数据框
    var oinportTx=oproreK.querySelectorAll('.inportTx')[0];//格式数据框关闭按钮
    var oproreb2=oproreK.querySelectorAll('.proreb2')[0];//格式数据框关闭按钮2
    var oproreb1=oproreK.querySelectorAll('.proreb1')[0];//格式数据框提交按钮


    console.log(aproappendrep);
    for(var i=0;i<aproappendrep.length;i++){
        (function(index){
            aproappendrep[index].onclick=function(){
                console.log(index);
                oproreK.style.display="block";
            }
        })(i)
    }
    oinportTx.onclick=function(){
        oproreK.style.display="none";
    }
    oproreb2.onclick=function(){
        oproreK.style.display="none";
    }

// 重新选择格式数据框格式数据显示
    var oproreM=document.querySelectorAll('.proreM')[0];
    var aproreMzc=oproreM.querySelectorAll('.proreMzc');
    var aPJliB=oproreM.querySelectorAll('.PJliB');

    for(var i=0;i<aproreMzc.length;i++){
        (function(index){
            aproreMzc[index].onclick=function(){
                console.log(index)
                for(var j=0;j<aPJliB.length;j++){
                    aPJliB[j].className="PJliB";
                }
                aPJliB[index].className="PJliB active";
            }
        })(i)
    }


//选择格式数据
    var aproreMli=oproreM.querySelectorAll('.proreMli');
    var proreMliPD=[];
    // console.log(aproreMli);

    for(var i=0;i<aproreMli.length;i++){
        proreMliPD[i]=0;
        // console.log(proreMliPD);
        (function(index){
            aproreMli[index].onclick=function(){
                if(proreMliPD[index]==0){
                    // aproreMli.className="proreMli active";
                    aproreMli[index].style.color="#5ca0e5";
                    proreMliPD[index]=1;
                }else{
                    // aproreMli.className="proreMli";
                    aproreMli[index].style.color="#666";
                    proreMliPD[index]=0;
                }
            }
        })(i)
    }


}


//应用说明2
function app_exp2(){
//关键字
    var oappexpGJZK=document.querySelectorAll('.appexpGJZK')[0];//关键字框
    var oappexpGJZadp=oappexpGJZK.querySelectorAll('.appexpGJZadp')[0];//关键字增加框
    var oappexpGJZadb=oappexpGJZK.querySelectorAll('.appexpGJZadb')[0];//关键字增加按钮
    var oappexpGJZKC=oappexpGJZK.querySelectorAll('.appexpGJZKC')[0];//关键字包含框


    add_deleteX();
    function add_deleteX(){
        var aappexpGJZ=oappexpGJZKC.querySelectorAll('.appexpGJZ');
        for(var i=0;i<aappexpGJZ.length;i++){
            (function(index){
                var oappexpGJZx=aappexpGJZ[index].querySelectorAll('.appexpGJZx')[0];
                oappexpGJZx.onclick=function(){
                    oappexpGJZKC.removeChild(oappexpGJZKC.children[index]);
                    add_deleteX();
                }
            })(i)
        }
    }
    
    oappexpGJZadb.onclick=function(){
        if(oappexpGJZadp.value!=" "&&oappexpGJZadp.value!=""){
            var oappexpGJZ=document.createElement("div");
            oappexpGJZ.className="appexpGJZ";

            var oappexpGJZt=document.createElement("div");
            oappexpGJZt.className="appexpGJZt";
            oappexpGJZt.innerHTML=oappexpGJZadp.value;
            // console.log(oappexpGJZadp.value);

            var oappexpGJZx=document.createElement("div");
            oappexpGJZx.className="appexpGJZx";

            oappexpGJZ.appendChild(oappexpGJZt);
            oappexpGJZ.appendChild(oappexpGJZx);
            oappexpGJZKC.appendChild(oappexpGJZ);

            add_deleteX();
        }
    }


}