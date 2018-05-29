/* 
* @Author: Marte
* @Date:   2018-04-23 15:32:03
* @Last Modified by:   Marte
* @Last Modified time: 2018-05-22 14:14:00
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
                var BTSXleft=aPJListli[j].offsetLeft;
                oBTSX.name=aPJListli[j].innerHTML;
                console.log(oBTSX.name);
                console.log(BTSXleft);
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
    // var oprodexqRbK=document.querySelectorAll('.prodexqRbK')[0];//banner图-容器
    // var aprodexqRb=oprodexqRbK.querySelectorAll('.prodexqRb');//banner图

    // var oprodexqRaK=document.querySelectorAll('.prodexqRaK')[0];//banner按钮-容器
    // var aprodexqRa=oprodexqRaK.querySelectorAll('.prodexqRa');//banner按钮

    // for(var i=0;i<aprodexqRa.length;i++){
    //     (function(j){
    //         aprodexqRa[j].onclick=function(){
    //             for(var k=0;k<aprodexqRa.length;k++){
    //                 aprodexqRa[k].className="prodexqRa";
    //                 aprodexqRb[k].className="prodexqRb";
    //             }
    //             aprodexqRa[j].className="prodexqRa active";
    //             aprodexqRb[j].className="prodexqRb active";
    //         }
    //     })(i)
    // }
    
    var oxiangmuRMzKC=document.querySelectorAll('.xiangmuRMzKC')[0];//长图
    var axiangmuRMi=oxiangmuRMzKC.querySelectorAll('.xiangmuRMi');//图
    var DWlength=oxiangmuRMzKC.querySelectorAll('.xiangmuRMz')[0].offsetWidth;//取单位图宽度

    var oxiangmuRMB=document.querySelectorAll('.xiangmuRMB')[0];//按钮框
    var axiangmuRMb=oxiangmuRMB.querySelectorAll('.xiangmuRMb');//按钮

    var oxiangmuRMt=document.querySelectorAll('.xiangmuRMt')[0];//按钮框上面的文字
    var xiangmuRMtCC=axiangmuRMi[0].name;//按钮框文字存储

    oxiangmuRMt.innerHTML=axiangmuRMi[0].name;

    var yiruPD=0;//移入判断

    for(var i=0;i<axiangmuRMb.length;i++){
        (function(index){
            axiangmuRMb[index].onmouseenter=function(){
                xiangmuRMtCC=oxiangmuRMt.innerHTML;
                oxiangmuRMt.innerHTML=axiangmuRMi[index].name;
                yiruPD=1;
                
                axiangmuRMb[index].onclick=function(){
                    for(var j=0;j<axiangmuRMb.length;j++){
                        axiangmuRMb[j].className="xiangmuRMb";
                    }
                    axiangmuRMb[index].className="xiangmuRMb active";
                    oxiangmuRMt.innerHTML=axiangmuRMi[index].name;

                    oxiangmuRMzKC.style.left=-DWlength*index+"px";

                    xiangmuRMtCC=axiangmuRMi[index].name;
                }

                axiangmuRMb[index].onmouseout=function(){
                    if(yiruPD==1){
                        oxiangmuRMt.innerHTML=xiangmuRMtCC;
                        yiruPD=0;
                    }
                }
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

    var aPJliB1Lt=document.querySelectorAll('.PJliB1Lt');
    var aPJliB2Lt=document.querySelectorAll('.PJliB2Lt');
    var awenjian=[];
    for(var i=0;i<aPJliB1Lt.length;i++){
        awenjian.push(aPJliB1Lt[i]);
    }
    for(var i=0;i<aPJliB2Lt.length;i++){
        awenjian.push(aPJliB2Lt[i]);
    }


    //文件树点击变蓝
    // console.log(awenjian);
    for(var i=0;i<awenjian.length;i++){
        (function(index){
            awenjian[index].onclick=function(){
                for(var j=0;j<awenjian.length;j++){
                    awenjian[j].style.color="#666";
                }
                awenjian[index].style.color="#5ca0e5";
            }
        })(i)
    }

//文件树添加根/叶、修改、删除
    var oprof_lbLtRaddg=document.querySelectorAll('.prof_lbLtRaddg')[0];//添加根按钮
    var oprof_lbLtRaddy=document.querySelectorAll('.prof_lbLtRaddy')[0];//添加叶按钮
    var oprof_lbLtRtch=document.querySelectorAll('.prof_lbLtRtch')[0];//修改按钮
    var oprof_lbLtRtde=document.querySelectorAll('.prof_lbLtRtde')[0];//删除按钮

    //添加
    var oprof_addK=document.querySelectorAll('.prof_addK')[0];//添加根、叶框
    var oprof_aeTx=oprof_addK.querySelectorAll('.prof_aeTx')[0];//添加根、叶框关闭按钮
    var oprof_aeb=oprof_addK.querySelectorAll('.prof_aeb')[0];//添加根、叶框提交按钮

    oprof_lbLtRaddg.onclick=function(){
        oprof_addK.style.display="block";
    }

    oprof_lbLtRaddy.onclick=function(){
        oprof_addK.style.display="block";
    }

    oprof_aeTx.onclick=function(){
        oprof_addK.style.display="none";
    }
    oprof_aeb.onclick=function(){
        oprof_addK.style.display="none";
    }


    //修改
    var oprof_editK=document.querySelectorAll('.prof_editK')[0];//添加根、叶框
    var oprof_aeTx=oprof_editK.querySelectorAll('.prof_aeTx')[0];//添加根、叶框关闭按钮
    var oprof_aeb=oprof_editK.querySelectorAll('.prof_aeb')[0];//添加根、叶框提交按钮

    oprof_lbLtRtch.onclick=function(){
        oprof_editK.style.display="block";
    }
    oprof_aeTx.onclick=function(){
        oprof_editK.style.display="none";
    }
    oprof_aeb.onclick=function(){
        oprof_editK.style.display="none";
    }


    //删除
    var oprof_delK=document.querySelectorAll('.prof_delK')[0];//添加根、叶框
    var oprof_aeTx=oprof_delK.querySelectorAll('.prof_aeTx')[0];//添加根、叶框关闭按钮
    var oprof_aeb=oprof_delK.querySelectorAll('.prof_aeb')[0];//添加根、叶框提交按钮

    oprof_lbLtRtde.onclick=function(){
        oprof_delK.style.display="block";
    }
    oprof_aeTx.onclick=function(){
        oprof_delK.style.display="none";
    }
    oprof_aeb.onclick=function(){
        oprof_delK.style.display="none";
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

    // pro_addkPD=0;

    opro_addk.onclick=function(event){
        // if(pro_addkPD==0){
            opro_addul.style.display="block";
        //     pro_addkPD=1;
        // }else{
        //     opro_addul.style.display="none";
        //     pro_addkPD=0;
        // }
        event.stopPropagation();
    }
    document.onclick=function(){
        opro_addul.style.display="none";
    }
    for(var i=0;i<apro_addli.length;i++){
        (function(index){
            apro_addli[index].onclick=function(){
                opro_addul.style.display="none";
                pro_addkPD=0;
            }
        })(i)
    }


    var opro_addul=document.querySelectorAll('.pro_addul')[0];

    opro_addul.style.right="0";
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
    // for(var i=0;i<apro_addli.length;i++){
    //     (function(index){
    //         apro_addli[index].onclick=function(){
    //             opro_addul.style.display="none";
    //         }
    //     })(i)
    // }

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
    // for(var i=0;i<aapp_typeli.length;i++){
    //     (function(index){
    //         aapp_typeli[index].onclick=function(){
    //             oapp_typeul.style.display="none";
    //             console.log(index)
    //         }
    //     })(i)
    // }

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
    // for(var i=0;i<aapp_typeli.length;i++){
    //     (function(index){
    //         aapp_typeli[index].onclick=function(){
    //             oapp_typeul.style.display="none";
    //             console.log(index)
    //         }
    //     })(i)
    // }

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
    var adddataBb = oadddataK.querySelectorAll('.adddataBb')[0];
    

    var adddataPD=0;//添加源数据框状态判断
    
    //提交数据源按钮
    adddataBb.onclick=function(){
    	var sourceFieldDatas = {};
    	var cs_id = $("#source_Select").val();
        aadddataMliTT=oadddataK.querySelectorAll('.adddataMliTT');
        for(var i=0;i<aadddataMliTT.length;i++){
            sourceFieldDatas[aadddataMliTT[i].id] = aadddataMliTT[i].value;
        }
        $.ajax({
        	url:"/wankangyuan/sourceData/insertSourceData",
        	type:"post",
        	data:{
        		cs_id:cs_id,
        		sourceFieldDatas:JSON.stringify(sourceFieldDatas)
        	},
        	dataType:"json",
        	success : function(data){
        		if(data.result == true){
        			alert(data.message);
        			//刷新页面
        			window.location.href="/wankangyuan/sourceData/firstIn?type=2";
        		}else{
        			alert(data.message);
        		}
        	},
        	error : function(){
        		alert("联网失败");
        	}
        });
    }
    
    //打开新添数据源弹出框
    opro_adddata.onclick=function(){
        if(adddataPD==0){
        	//进行网络请求，当前的数据源的字段
        	var cs_id = $("#source_Select").val();
        	$.ajax({
        		url:"/wankangyuan/sourceData/getInsertSourceDataForm",
        		type:"post",
        		data:{
        			cs_id:cs_id
        		},
        		dataType:"json",
        		success : function(data){
        			if(data.result == true){
        				//对表单进行填充
        				var adddataM = $("#adddataM");
        				adddataM.empty();
        				
        				var sourceFields = data.source.sourceFields;
        				for(var index in sourceFields){
        					
        					adddataM.append('<div class="adddataMli">'+
                                   				'<div class="adddataMlit">'+sourceFields[index].csf_name+'</div>'+
                                    			'<input type="text" id="'+sourceFields[index].csf_id+'" class="adddataMliTT adddataMliT" />'+
                                			'</div>');

        				}
        	            oadddataK.style.display="block";
        	            adddataPD=1;
        	            for(var i=0;i<aadddataMliTT.length;i++){
        	                aadddataMliTT[i].value="";//打开添加源数据框的时候清空所有文本框和文本域
        	            }
        			}else{
        				alert(data.message);
        			}
        		},
        		error : function(){
        			alert("联网失败");
        		}
        	});
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

            oappexpGJZadp.value="";

            add_deleteX();
        }
    }


}

function data_dataclick2(){
    var oPJliBK=document.querySelectorAll('.PJliBK')[0];

    var aPJliBLt=[];
    var aPJliB1Lt=oPJliBK.querySelectorAll('.PJliB1Lt');
    var aPJliB2Lt=oPJliBK.querySelectorAll('.PJliB2Lt');

    for(var i=0;i<aPJliB1Lt.length;i++){
        aPJliBLt.push(aPJliB1Lt[i]);
    }
    for(var i=0;i<aPJliB2Lt.length;i++){
        aPJliBLt.push(aPJliB2Lt[i]);
    }
    // console.log(aPJliBLt);


    // for(var i=0;i<aPJliBLt.length;i++){
    //     (function(index){
    //         aPJliBLt[index].onclick=function(event){
    //             for(var j=0;j<aPJliBLt.length;j++){
    //                 aPJliBLt[j].style.color="#666";
    //             }
    //             aPJliBLt[index].style.color="#5ca0e5";
    //             // event.stopPropagation();
    //         }
    //     })(i)
    // }


    // document.onclick=function(){
    //     for(var j=0;j<aPJliBLt.length;j++){
    //         aPJliBLt[j].style.color="#666";
    //     }
    // }

//添加修改节点框
    var odaclLb_add=document.querySelectorAll('.daclLb_add')[0];//添加按钮
    var odaclLb_mod=document.querySelectorAll('.daclLb_mod')[0];//修改按钮
    //var odaclLb_addroot=document.querySelectorAll('.daclLb_addroot')[0];//添加根按钮
    var odataeditK=document.querySelectorAll('.dataeditK')[0];//框
    var odataeditTx=odataeditK.querySelectorAll('.dataeditTx')[0];//关闭按钮

    odaclLb_add.onclick=function(){
    	
		var afuxuanK=document.querySelectorAll('.fuxuanK41');
		
        var afuxuan=[];
        for(var i=0;i<afuxuanK.length;i++){
            afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
        }
        
        var ids = [];
        for(var i=0;i<afuxuanK.length;i++){
        	if(afuxuan[i].checked){
        		ids.push(afuxuan[i].name);
        	}
        }
        
        if(ids == ""){
        	alert("请勾选待增加结点的格式数据类型！");
        	return;
        }else if(ids.length > 1){
        	alert("最多选择一中格式数据类型！")
        }else{
        	document.querySelectorAll('.type')[0].value = "add";
        	odataeditK.style.display="block";
        }
 
    }
    odaclLb_mod.onclick=function(){
        
		var afuxuanK=document.querySelectorAll('.fuxuanK42');
		
        var afuxuan=[];
        for(var i=0;i<afuxuanK.length;i++){
            afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
        }
        
        var ids = [];
        for(var i=0;i<afuxuanK.length;i++){
        	if(afuxuan[i].checked){
        		ids.push(afuxuan[i].name);
        	}
        }
        
        if(ids == ""){
        	alert("请勾选待修改名称的结点！");
        	return;
        }else if(ids.length > 1){
        	alert("最多选择一个结点！")
        }else{
        	document.querySelectorAll('.type')[0].value = "edit";
        	odataeditK.style.display="block";
        }
    }
    /*odaclLb_addroot.onclick=function(){
        odataeditK.style.display="block";
    }*/
    odataeditTx.onclick=function(){
        odataeditK.style.display="none";
    }


//编辑右侧上方数据框
    
    // var opdclmRz_ul=document.querySelectorAll('.pdclmRz_ul')[0];//右侧上方按钮列表
    // var opdclmRz_edit=opdclmRz_ul.querySelectorAll('.pdclmRz_edit')[0];//右侧上方编辑按钮

    // var opdclmRz_ul2=document.querySelectorAll('.pdclmRz_ul2')[0];//右侧上方编辑框
    // var opdclmRz_ul2Tx=opdclmRz_ul2.querySelectorAll('.pdclmRz_ul2Tx')[0];//右侧上方编辑按钮

    // opdclmRz_edit.onclick=function(){
    //     opdclmRz_ul2.style.display="block";
    // }
    // opdclmRz_ul2Tx.onclick=function(){
    //     opdclmRz_ul2.style.display="none";
    // }


    var opdclmRz_ul=document.querySelectorAll('.pdclmRz_ul')[0];//右侧上方按钮列表
    var opdclmRz_save=opdclmRz_ul.querySelectorAll('.pdclmRz_save')[0];//右侧上方保存按钮
    //var opdclmRz_edit=opdclmRz_ul.querySelectorAll('.pdclmRz_edit')[0];//右侧上方编辑按钮



    var oprodaclmRzB=document.querySelectorAll('.prodaclmRzB')[0];//右侧上方框

    var ainput_check=oprodaclmRzB.querySelectorAll('.input_check');//多选框


    // var aprodaclmRzTtnr=oprodaclmRzB.querySelectorAll('.prodaclmRzTtnr');//右侧上方内容
    // var aprodaclmRzTtnr2=oprodaclmRzB.querySelectorAll('.prodaclmRzTtnr2');//右侧上方内容可编辑

    // opdclmRz_edit.onclick=function(){
    //     for(var i=0;i<aprodaclmRzTtnr.length;i++){
    //         aprodaclmRzTtnr[i].style.display="none";
    //     }
    //     for(var i=0;i<aprodaclmRzTtnr2.length;i++){
    //         aprodaclmRzTtnr2[i].style.display="block";
    //     }
    // }

    // opdclmRz_save.onclick=function(){
    //     for(var i=0;i<aprodaclmRzTtnr.length;i++){
    //         aprodaclmRzTtnr[i].style.display="block";
    //     }
    //     for(var i=0;i<aprodaclmRzTtnr2.length;i++){
    //         aprodaclmRzTtnr2[i].style.display="none";
    //     }
    // }
    
    



    // opdclmRz_edit.onclick=function(){
    //     for(var i=0;i<ainput_check.length;i++){
    //         // aprodaclmRzTtnr[i].style.display="none";
    //         if(ainput_check[i].checked){
    //             var oa=ainput_check[i].parentNode;
    //             var ob=oa.parentNode;
    //             var oc=ob.querySelectorAll('.prodaclmRzTtnr')[0];
    //             var od=ob.querySelectorAll('.prodaclmRzTtnr2')[0];
    //             oc.style.display="none";
    //             od.style.display="block";
    //         }
    //     }
    // }
    // opdclmRz_save.onclick=function(){
    //     for(var i=0;i<ainput_check.length;i++){
    //         // aprodaclmRzTtnr[i].style.display="none";
    //         if(ainput_check[i].checked){
    //             var oa=ainput_check[i].parentNode;
    //             var ob=oa.parentNode;
    //             var oc=ob.querySelectorAll('.prodaclmRzTtnr')[0];
    //             var od=ob.querySelectorAll('.prodaclmRzTtnr2')[0];

    //             oc.innerHTML=od.value;
    //             oc.style.display="block";
    //             od.style.display="none";
                
            
    //         }
    //     }
    // }
//    
//    
//    opdclmRz_edit.onclick=function(){
//        for(var i=0;i<ainput_check.length;i++){
//            // aprodaclmRzTtnr[i].style.display="none";
//            if(ainput_check[i].checked){
//                var oa=ainput_check[i].parentNode;
//                var ob=oa.parentNode;
//                // var oc=ob.querySelectorAll('.prodaclmRzTtnr')[0];
//                var od=ob.querySelectorAll('.prodaclmRzTtnr2')[0];
//                // oc.style.display="none";
//                console.log(od);
//                od.readOnly=false;
//            }
//        }
//    }
//    opdclmRz_save.onclick=function(){
//        for(var i=0;i<ainput_check.length;i++){
//            // aprodaclmRzTtnr[i].style.display="none";
//            if(ainput_check[i].checked){
//                var oa=ainput_check[i].parentNode;
//                var ob=oa.parentNode;
//                // var oc=ob.querySelectorAll('.prodaclmRzTtnr')[0];
//                var od=ob.querySelectorAll('.prodaclmRzTtnr2')[0];
//
//                // oc.innerHTML=od.value;
//                // oc.style.display="block";
//                od.readOnly=true;
//            }
//        }
//    }
}

function data_dataclick(){
	
    var oprodaclmRz=document.querySelectorAll('.prodaclmRz')[0];
    var oquanxuanK=oprodaclmRz.querySelectorAll('.quanxuanK')[0];
    //var oquanxuan=oquanxuanK.querySelectorAll('.input_check')[0];
    var afuxuanK=oprodaclmRz.querySelectorAll('.fuxuanK5');

    var afuxuan=[];
    // var afuxuanK=[];

    if(afuxuanK[0]){
        for(var i=0;i<afuxuanK.length;i++){
            afuxuan.push(afuxuanK[i].querySelectorAll('.input_check')[0]);
        }
    }
    console.log(afuxuanK)
    
        
//    oquanxuanK.onchange=function(){
//        if(oquanxuan.checked){
//            for(var i=0;i<afuxuanK.length;i++){
//                afuxuan[i].checked=1;
//            }
//        }else{
//            // console.log(2);
//            for(var i=0;i<afuxuanK.length;i++){
//                afuxuan[i].checked=0;
//            }
//        }
//    }


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




    var oprodaclmRz2=document.querySelectorAll('.prodaclmRz2')[0];
    var oquanxuanK2=oprodaclmRz2.querySelectorAll('.quanxuanK')[0];
    var oquanxuan2=oquanxuanK2.querySelectorAll('.input_check')[0];
    var afuxuanK2=oprodaclmRz2.querySelectorAll('.fuxuanK5');


    var afuxuan2=[];
    // var afuxuanK2=[];

    if(afuxuanK2[0]){
        for(var i=0;i<afuxuanK2.length;i++){
            afuxuan2.push(afuxuanK2[i].querySelectorAll('.input_check')[0]);
        }
    }

    oquanxuanK2.onchange=function(){
        if(oquanxuan2.checked){
            for(var i=0;i<afuxuanK2.length;i++){
                afuxuan2[i].checked=1;
            }
        }else{
            // console.log(2);
            for(var i=0;i<afuxuanK2.length;i++){
                afuxuan2[i].checked=0;
            }
        }
    }

    if(afuxuanK2[0]){
        for(var i=0;i<afuxuanK2.length;i++){
            (function(index){
                afuxuanK2[i].onchange=function(){
                    var fuxuanPD2=0;
                    for(var j=0;j<afuxuanK2.length;j++){
                        if(afuxuan2[j].checked){
                            fuxuanPD2++;
                        }
                        console.log(afuxuan2[j].checked);
                    }
                    console.log(fuxuanPD2);
                    if(fuxuanPD2==afuxuanK2.length){
                        oquanxuan2.checked=1;
                    }else if(fuxuanPD2!=afuxuanK2.length){
                        oquanxuan2.checked=0;
                    }
                }
            })(i)
        }
    }


    //添加修改单个数据
    var oclmRsb_add=document.querySelectorAll('.clmRsb_add')[0];//添加数据按钮
    var oclmRsb_modify=document.querySelectorAll('.clmRsb_modify')[0];//修改数据按钮
    var oclmRsb_inport=document.querySelectorAll('.clmRsb_inport')[0];//导入按钮
    var oclmReditK=document.querySelectorAll('.clmReditK')[0];//添加修改数据框
    var oclmReditTx=oclmReditK.querySelectorAll('.clmReditTx')[0];//添加修改数据框关闭按钮
    var oclmReditb=oclmReditK.querySelectorAll('.clmReditb')[0];//添加修改数据框提交按钮

    var oclmRinportK=document.querySelectorAll('.clmRinportK')[0];//导入框
    var oinportTx=oclmRinportK.querySelectorAll('.inportTx')[0];//导入框


    oclmRsb_add.onclick=function(){
    	
    	//需要设置当前的格式字段列表
    	
    	
    	
    	
    	
    	
        oclmReditK.style.display="block";
    }
    oclmRsb_modify.onclick=function(){
        oclmReditK.style.display="block";
    }

    oclmReditTx.onclick=function(){
        oclmReditK.style.display="none";
    }


    oclmRsb_inport.onclick=function(){
        oclmRinportK.style.display="block";
    }
    oinportTx.onclick=function(){
        oclmRinportK.style.display="none";
    }


}


//首页
function index(){
    var osearchI2=document.querySelectorAll('.searchI2')[0];//外置搜索按钮
    var osearchK=document.querySelectorAll('.searchK')[0];//搜索框
    var osearchI=osearchK.querySelectorAll('.searchI')[0];//搜索按钮
    var osearchX=osearchK.querySelectorAll('.searchX')[0];//搜索关闭
    var osearchP=osearchK.querySelectorAll('.searchP')[0];//搜索输入栏

    
//搜索框
    osearchI2.onclick=function(){
        osearchK.style.display="block";
        osearchI2.style.display="none";
        osearchP.value="";
    }

    osearchX.onclick=function(){
        osearchK.style.display="none";
        osearchI2.style.display="block";
    }
    
//banner
    var oxiangmuRMzKC=document.querySelectorAll('.xiangmuRMzKC')[0];//长图
    var axiangmuRMi=oxiangmuRMzKC.querySelectorAll('.xiangmuRMi');//图
    var DWlength=oxiangmuRMzKC.querySelectorAll('.xiangmuRMz')[0].offsetWidth;//取单位图宽度

    var oxiangmuRMB=document.querySelectorAll('.xiangmuRMB')[0];//按钮框
    var axiangmuRMb=oxiangmuRMB.querySelectorAll('.xiangmuRMb');//按钮

    var oxiangmuRMt=document.querySelectorAll('.xiangmuRMt')[0];//按钮框上面的文字
    var xiangmuRMtCC=axiangmuRMi[0].name;//按钮框文字存储

    oxiangmuRMt.innerHTML=axiangmuRMi[0].name;

    var yiruPD=0;//移入判断

    for(var i=0;i<axiangmuRMb.length;i++){
        (function(index){
            axiangmuRMb[index].onmouseenter=function(){
                xiangmuRMtCC=oxiangmuRMt.innerHTML;
                oxiangmuRMt.innerHTML=axiangmuRMi[index].name;
                yiruPD=1;
                
                axiangmuRMb[index].onclick=function(){
                    for(var j=0;j<axiangmuRMb.length;j++){
                        axiangmuRMb[j].className="xiangmuRMb";
                    }
                    axiangmuRMb[index].className="xiangmuRMb active";
                    oxiangmuRMt.innerHTML=axiangmuRMi[index].name;

                    oxiangmuRMzKC.style.left=-DWlength*index+"px";

                    xiangmuRMtCC=axiangmuRMi[index].name;
                }

                axiangmuRMb[index].onmouseout=function(){
                    if(yiruPD==1){
                        oxiangmuRMt.innerHTML=xiangmuRMtCC;
                        yiruPD=0;
                    }
                }
            }
        })(i)
    }

//左侧项目列表
    var axiangmuLMz=document.querySelectorAll('.xiangmuLMz');//多个项目
    var axiangmuLMzT=document.querySelectorAll('.xiangmuLMzT');//多个项目标题
    var axiangmuLMzM=document.querySelectorAll('.xiangmuLMzM');//多个项目详情

    for(var i=0;i<axiangmuLMz.length;i++){
        (function(index){
            axiangmuLMz[index].onclick=function(){
                for(var j=0;j<axiangmuLMz.length;j++){
                    axiangmuLMz[j].className="xiangmuLMz";
                }
                axiangmuLMz[index].className="xiangmuLMz active";
            }
        })(i)
    }
    


}


//登录
function login(){

}


//找回密码
function forget_ps(){
    var ologinMzRb=document.querySelectorAll('.loginMzRb')[0];//发送验证码
    var ologinMzRb2=document.querySelectorAll('.loginMzRb2')[0];//禁用发送验证码
    var ofor_zh=document.querySelectorAll('.for_zh')[0];//手机号框
    var ofor_ps=document.querySelectorAll('.for_ps')[0];//密码
    var ofor_ps2=document.querySelectorAll('.for_ps2')[0];//重复密码
    var opro_enter=document.querySelectorAll('.pro_enter')[0];//确认


    ologinMzRb.onclick=function(){
        phonezhengze(ofor_zh,ologinMzRb,ologinMzRb2,60);
    }
}


//手机号正则
function phonezhengze(shoujiK,anniu,anniu2,timesz){
    var phoneReg = /(^1[3|4|5|7|8]\d{9}$)|(^09\d{8}$)/;  
    //电话  
    var phone = shoujiK.value;  
    if (!phoneReg.test(phone)) {  
        alert('请输入有效的手机号码！');  
        return false;  
    }else{
        anniu.style.display="none";
        anniu2.style.display="block";

        var time=timesz;
        var YZMjishi=0;
        anniu2.innerHTML=time+"s后重试";
    
        YZMjishi=setInterval(function(){
            time--;
            anniu2.innerHTML=time+"s后重试";
            if(time<=0){
                clearInterval(YZMjishi);
                anniu.style.display="block";
                anniu2.style.display="none";
            }
        },1000);
    }
}

//用户信息页面
function user_info(){

//选项卡
    var ouserMLtabK=document.querySelectorAll('.userMLtabK')[0];//选项卡按钮列表
    var auserMLtab=ouserMLtabK.querySelectorAll('.userMLtab');//选项卡按钮

    var ouserMRMtabK=document.querySelectorAll('.userMRMtabK')[0];//选项卡显示列表
    var auserMRMtab=ouserMRMtabK.querySelectorAll('.userMRMtab');//选项卡显示

    for(var i=0;i<auserMLtab.length;i++){
        (function(index){
            auserMLtab[index].onclick=function(){
                for(var j=0;j<auserMLtab.length;j++){
                    auserMLtab[j].className="userMLtab";
                    auserMRMtab[j].className="userMRMtab";
                }
                auserMLtab[index].className="userMLtab active";
                auserMRMtab[index].className="userMRMtab active";
            }
        })(i)
    }

    // kongjian(40,36);//空间存储调用
    function kongjian(zong,yi){

        var kongjian_zong=zong||20;//存储总空间
        var kongjian_yi=yi||5;//存储已用空间
        var kongjian_bi=0;//空间使用比
        if(kongjian_zong!=0&&kongjian_yi<kongjian_zong){
            kongjian_bi=kongjian_yi/kongjian_zong;
        }else{
            kongjian_bi=1;
        }

    //存储空间条
        if(document.querySelectorAll('.user_kongjianT')[0]){
            var ouser_kongjianT=document.querySelectorAll('.user_kongjianT')[0];//存储空间文字
            var ospan1=ouser_kongjianT.querySelectorAll('span')[0];//存储空间文字
            var ospan2=ouser_kongjianT.querySelectorAll('span')[1];//存储空间文字
            //ospan1.innerHTML=kongjian_yi;
            ospan2.innerHTML=kongjian_zong;


            if(document.querySelectorAll('.user_kongjianK')[0]){
                var ouser_kongjianK=document.querySelectorAll('.user_kongjianK')[0];//存储空间外条
                var ouser_kongjianZ=ouser_kongjianK.querySelectorAll('.user_kongjianZ')[0];//存储空间内条

                ouser_kongjianZ.style.width=kongjian_bi*350+"px";//内条长度
            }
        }
    }

//头像上传按钮
    var ouserMRT=document.querySelectorAll('.userMRT')[0];//头像框
    var ouserMRTts=ouserMRT.querySelectorAll('.userMRTts')[0];//头像框上传按钮
    var otouxiangupK=document.querySelectorAll('.touxiangupK')[0];//头像框上传框

    var otouxiangupTx=otouxiangupK.querySelectorAll('.touxiangupTx')[0];//头像框上传框关闭按钮
    var otouxiangupLJ=otouxiangupK.querySelectorAll('.touxiangupLJ')[0];//头像框上传框文件路径
    var otouxiangupp=otouxiangupK.querySelectorAll('.touxiangupp')[0];//头像框上传框文件input
    var otouxiang_sele=otouxiangupK.querySelectorAll('.touxiang_sele')[0];//头像框上传框选择按钮
    var otouxiang_up=otouxiangupK.querySelectorAll('.touxiang_up')[0];//头像框上传框上传按钮


    ouserMRTts.onclick=function(){
        otouxiangupK.style.display="block";
        document.querySelectorAll('.touxiangupp')[0].value="";
        otouxiangupp.onchange();
    }
    otouxiangupTx.onclick=function(){
        otouxiangupK.style.display="none";
    }
    otouxiang_sele.onclick=function(){
        otouxiangupp.click();
    }
    otouxiangupp.onchange=function(){
        if(otouxiangupp.value!=""){
            otouxiangupLJ.innerHTML=otouxiangupp.value;
        }else{
            otouxiangupLJ.innerHTML="&nbsp;"
        }
        
    }
    // otouxiang_up.onclick=function(){
    //     console.log(otouxiangupp.value);
    // }

//修改密码、修改手机、修改邮箱
    var ouserMRMtab=document.querySelectorAll('.userMRMtab')[0];//用户信息
    var ouser_mo_phone=document.querySelectorAll('.user_mo_phone')[0];//修改手机
    var ouser_mo_email=document.querySelectorAll('.user_mo_email')[0];//修改邮箱
    var ouser_mo_passw=document.querySelectorAll('.user_mo_passw')[0];//修改密码

    

    var ouserM=document.querySelectorAll('.userM')[0];
    var aupdateinfoKd=document.querySelectorAll('.updateinfoK');//所有修改框

    var oupdate_phoneK=document.querySelectorAll('.update_phoneK')[0];//修改手机框
    var oudinfoRbca=oupdate_phoneK.querySelectorAll('.udinfoRbca')[0];//修改手机框取消按钮
    var oudinfoRben=oupdate_phoneK.querySelectorAll('.udinfoRben')[0];//修改手机框确认按钮

    var oudPHphone=oupdate_phoneK.querySelectorAll('.udPHphone')[0];//修改手机框手机号
    var oudPHyzfs=oupdate_phoneK.querySelectorAll('.udPHyzfs')[0];//修改手机框发送验证码按钮
    var oudPHyzfs2=oupdate_phoneK.querySelectorAll('.udPHyzfs2')[0];//修改手机框发送验证码按2

    var oudPHphone2=oupdate_phoneK.querySelectorAll('.udPHphone2')[0];//修改手机框手机号2
    var oudPHyzfs3=oupdate_phoneK.querySelectorAll('.udPHyzfs3')[0];//修改手机框发送验证码按钮3
    var oudPHyzfs4=oupdate_phoneK.querySelectorAll('.udPHyzfs4')[0];//修改手机框发送验证码按钮4

    oudPHyzfs.onclick=function(){
        phonezhengze(oudPHphone,oudPHyzfs,oudPHyzfs2,60);
    }
    oudPHyzfs3.onclick=function(){
        phonezhengze(oudPHphone2,oudPHyzfs3,oudPHyzfs4,60);
    }


    var oupdate_emailK=document.querySelectorAll('.update_emailK')[0];//修改邮箱框
    var oudinfoRbca2=oupdate_emailK.querySelectorAll('.udinfoRbca')[0];//修改邮箱框取消按钮
    var oudinfoRben2=oupdate_emailK.querySelectorAll('.udinfoRben')[0];//修改邮箱框确认按钮




    var oupdate_passwK=document.querySelectorAll('.update_passwK')[0];//修改密码框
    var oudinfoRbca3=oupdate_passwK.querySelectorAll('.udinfoRbca')[0];//修改密码框取消按钮
    var oudinfoRben3=oupdate_passwK.querySelectorAll('.udinfoRben')[0];//修改密码框确认按钮
    var oudPSphone=oupdate_passwK.querySelectorAll('.udPSphone')[0];//修改密码框手机号
    var oudPSyzfs=oupdate_passwK.querySelectorAll('.udPSyzfs')[0];//修改密码框发送验证码按钮
    var oudPSyzfs2=oupdate_passwK.querySelectorAll('.udPSyzfs2')[0];//修改密码框发送验证码按钮


    oudPSyzfs.onclick=function(){
        phonezhengze(oudPSphone,oudPSyzfs,oudPSyzfs2,60);
    }


    for(var i=0;i<aupdateinfoKd.length;i++){
        aupdateinfoKd[i].style.height=ouserM.offsetHeight+"px";
    }

    function updateQL(){
        var aupdateQLk=document.querySelectorAll('.updateQLk');//点击后需要清理的框
        for(var i=0;i<aupdateQLk.length;i++){
            aupdateQLk[i].value="";
        }
    }

    ouser_mo_phone.onclick=function(){
        oupdate_phoneK.style.display="block";
        oudinfoRbca.onclick=function(){
            oupdate_phoneK.style.display="none";
        }
        updateQL();
    }
    ouser_mo_email.onclick=function(){
        oupdate_emailK.style.display="block";
        oudinfoRbca2.onclick=function(){
            oupdate_emailK.style.display="none";
        }
        updateQL();
    }
    ouser_mo_passw.onclick=function(){
        oupdate_passwK.style.display="block";
        oudinfoRbca3.onclick=function(){
            oupdate_passwK.style.display="none";
        }
        updateQL();
    }
}
// kongjian(40,36);//空间存储调用
function kongjian(zong,yi){

    var kongjian_zong=zong||20;//存储总空间
    var kongjian_yi=yi||0;//存储已用空间
    var kongjian_bi=0;//空间使用比
    if(kongjian_zong!=0&&kongjian_yi<kongjian_zong){
        kongjian_bi=kongjian_yi/kongjian_zong;
    }else{
        kongjian_bi=1;
    }

//存储空间条
    if(document.querySelectorAll('.user_kongjianT')[0]){
        var ouser_kongjianT=document.querySelectorAll('.user_kongjianT')[0];//存储空间文字
        var ospan1=ouser_kongjianT.querySelectorAll('span')[0];//存储空间文字
        var ospan2=ouser_kongjianT.querySelectorAll('span')[1];//存储空间文字
        //ospan1.innerHTML=kongjian_yi;
        ospan2.innerHTML=kongjian_zong;


        if(document.querySelectorAll('.user_kongjianK')[0]){
            var ouser_kongjianK=document.querySelectorAll('.user_kongjianK')[0];//存储空间外条
            var ouser_kongjianZ=ouser_kongjianK.querySelectorAll('.user_kongjianZ')[0];//存储空间内条

            ouser_kongjianZ.style.width=kongjian_bi*350+"px";//内条长度
        }
    }
}