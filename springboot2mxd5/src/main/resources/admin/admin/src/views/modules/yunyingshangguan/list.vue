<template>
	<div class="main-content">
		<!-- 列表页 -->
		<template v-if="showFlag">
			<el-form class="center-form-pv" :style='{"width":"100%","margin":"16px 0 20px","flexWrap":"wrap","display":"flex"}' :inline="true" :model="searchForm">
				<el-row :style='{"width":"100%","margin":"0","display":"block"}' >
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}'>
						<label :style='{"margin":"0 10px 0 0","color":"#fff","display":"inline-block","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">运营账号</label>
						<el-input v-model="searchForm.yunyingzhanghao" placeholder="运营账号" clearable></el-input>
					</div>
					<div :style='{"margin":"0 10px 0 0","display":"inline-block"}'>
						<label :style='{"margin":"0 10px 0 0","color":"#fff","display":"inline-block","lineHeight":"40px","fontSize":"14px","fontWeight":"500","height":"40px"}' class="item-label">运营姓名</label>
						<el-input v-model="searchForm.yunyingxingming" placeholder="运营姓名" clearable></el-input>
					</div>
					<el-button :style='{"cursor":"pointer","padding":"0 30px","boxShadow":"0px 0px 0px #ddd","borderColor":"#17a5ff","margin":"0 0 0 10px","color":"#798fe1","outline":"none","borderRadius":"20px","background":"#eaf2fa","borderWidth":"4px","width":"auto","fontSize":"16px","lineHeight":"40px","borderStyle":"solid double solid double","height":"44px"}' type="success" @click="search()">查询</el-button>
				</el-row>

				<el-row :style='{"width":"100%","padding":"0","margin":"20px 0 20px","background":"none","display":"flex"}'>
					<el-button :style='{"border":"1px solid #c1ccf4","cursor":"pointer","padding":"0 24px","boxShadow":"0 2px 6px rgba(0,0,0,.6)","margin":"0 10px 0 0","outline":"none","color":"#c1ccf4","borderRadius":"20px","background":"rgba(243,234,250,.2)","width":"auto","fontSize":"14px","height":"40px"}' v-if="isAuth('yunyingshangguan','新增')" type="success" @click="addOrUpdateHandler()">新增</el-button>
					<el-button :style='{"border":"1px solid #d67081","cursor":"pointer","padding":"0 24px","boxShadow":"0 2px 6px rgba(0,0,0,.6)","margin":"0 10px 0 0","outline":"none","color":"#df2543","borderRadius":"20px","background":"rgba(223,37,67,.2)","width":"auto","fontSize":"14px","height":"40px"}' v-if="isAuth('yunyingshangguan','删除')" :disabled="dataListSelections.length <= 0" type="danger" @click="deleteHandler()">删除</el-button>




				</el-row>
			</el-form>
			
			<!-- <div> -->
				<el-table class="tables"
					:stripe='true'
					:style='{"padding":"0","borderColor":"#3c769b #3c769b #2adbcb #3c769b","margin":"0 0 20px","borderRadius":"0px","borderWidth":"4px 1px 1px 1px","background":"none","width":"100%","borderStyle":"solid dashed dashed dashed","order":"4"}' 
					v-if="isAuth('yunyingshangguan','查看')"
					:data="dataList"
					v-loading="dataListLoading"
				@selection-change="selectionChangeHandler">
					<el-table-column :resizable='true' type="selection" align="center" width="50"></el-table-column>
					<el-table-column :resizable='true' :sortable='false' label="索引" type="index" width="50" />
					<el-table-column :resizable='true' :sortable='false'  
						prop="yunyingzhanghao"
					label="运营账号">
						<template slot-scope="scope">
							{{scope.row.yunyingzhanghao}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'  
						prop="yunyingxingming"
					label="运营姓名">
						<template slot-scope="scope">
							{{scope.row.yunyingxingming}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'  
						prop="xingbie"
					label="性别">
						<template slot-scope="scope">
							{{scope.row.xingbie}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'  
						prop="dianhua"
					label="电话">
						<template slot-scope="scope">
							{{scope.row.dianhua}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false'  
						prop="youxiang"
					label="邮箱">
						<template slot-scope="scope">
							{{scope.row.youxiang}}
						</template>
					</el-table-column>
					<el-table-column :resizable='true' :sortable='false' prop="touxiang" width="200" label="头像">
						<template slot-scope="scope">
							<div v-if="scope.row.touxiang">
								<img v-if="scope.row.touxiang.substring(0,4)=='http'" :src="scope.row.touxiang.split(',')[0]" width="100" height="100">
								<img v-else :src="$base.url+scope.row.touxiang.split(',')[0]" width="100" height="100">
							</div>
							<div v-else>无图片</div>
						</template>
					</el-table-column>
					<el-table-column width="300" label="操作">
						<template slot-scope="scope">
							<el-button :style='{"border":"1px solid #c1ccf4","cursor":"pointer","padding":"0 16px","margin":"3px 6px 3px 0","outline":"none","color":"#c1ccf4","borderRadius":"20px","background":"rgba(193,204,244,.1)","width":"auto","fontSize":"14px","height":"32px"}' v-if=" isAuth('yunyingshangguan','查看')" type="success" size="mini" @click="addOrUpdateHandler(scope.row.id,'info')">详情</el-button>
							<el-button :style='{"border":"1px solid #22d6c3","cursor":"pointer","padding":"0 16px","margin":"3px 6px 3px 0","outline":"none","color":"#22d6c3","borderRadius":"20px","background":"rgba(31,191,174,.1)","width":"auto","fontSize":"14px","height":"32px"}' v-if=" isAuth('yunyingshangguan','修改')" type="primary" size="mini" @click="addOrUpdateHandler(scope.row.id)">修改</el-button>





							<el-button :style='{"border":"1px solid #dc333b","cursor":"pointer","padding":"0 16px","margin":"3px 6px 3px 0","outline":"none","color":"#dc333b","borderRadius":"20px","background":"rgba(220,51,59,.1)","width":"auto","fontSize":"14px","height":"32px"}' v-if="isAuth('yunyingshangguan','删除') " type="danger" size="mini" @click="deleteHandler(scope.row.id)">删除</el-button>
						</template>
					</el-table-column>
				</el-table>
				<el-pagination
					@size-change="sizeChangeHandle"
					@current-change="currentChangeHandle"
					:current-page="pageIndex"
					background
					:page-sizes="[10, 20, 30, 50]"
					:page-size="pageSize"
					:layout="layouts.join()"
					:total="totalPage"
					prev-text="<"
					next-text=">"
					:hide-on-single-page="true"
					:style='{"padding":"8px 10px","margin":"20px 0 0","borderColor":"#2adbcb","whiteSpace":"nowrap","color":"#b35ff3","background":"none","borderWidth":"0px","width":"100%","lineHeight":"54px","borderStyle":"dotted dashed solid double","fontWeight":"500","order":"5","height":"54px"}'
				></el-pagination>
			<!-- </div> -->
		</template>
		
		<!-- 添加/修改页面  将父组件的search方法传递给子组件-->
		<add-or-update v-if="addOrUpdateFlag" :parent="this" ref="addOrUpdate"></add-or-update>





	</div>
</template>

<script>
import axios from 'axios'
import AddOrUpdate from "./add-or-update";
export default {
  data() {
    return {
      searchForm: {
        key: ""
      },
      form:{},
      dataList: [],
      pageIndex: 1,
      pageSize: 10,
      totalPage: 0,
      dataListLoading: false,
      dataListSelections: [],
      showFlag: true,
      sfshVisiable: false,
      shForm: {},
      chartVisiable: false,
      chartVisiable1: false,
      chartVisiable2: false,
      chartVisiable3: false,
      chartVisiable4: false,
      chartVisiable5: false,
      addOrUpdateFlag:false,
      layouts: ["total","prev","pager","next","sizes","jumper"],


    };
  },
  created() {
    this.init();
    this.getDataList();
    this.contentStyleChange()
  },
  mounted() {
  },
  filters: {
    htmlfilter: function (val) {
      return val.replace(/<[^>]*>/g).replace(/undefined/g,'');
    }
  },
  components: {
    AddOrUpdate,
  },
  methods: {

    contentStyleChange() {
      this.contentPageStyleChange()
    },
    // 分页
    contentPageStyleChange(){
      let arr = []

      // if(this.contents.pageTotal) arr.push('total')
      // if(this.contents.pageSizes) arr.push('sizes')
      // if(this.contents.pagePrevNext){
      //   arr.push('prev')
      //   if(this.contents.pagePager) arr.push('pager')
      //   arr.push('next')
      // }
      // if(this.contents.pageJumper) arr.push('jumper')
      // this.layouts = arr.join()
      // this.contents.pageEachNum = 10
    },








    init () {
    },
    search() {
      this.pageIndex = 1;
      this.getDataList();
    },

    // 获取数据列表
    getDataList() {
      this.dataListLoading = true;
      let params = {
        page: this.pageIndex,
        limit: this.pageSize,
        sort: 'id',
        order: 'desc',
      }
          if(this.searchForm.yunyingzhanghao!='' && this.searchForm.yunyingzhanghao!=undefined){
            params['yunyingzhanghao'] = '%' + this.searchForm.yunyingzhanghao + '%'
          }
          if(this.searchForm.yunyingxingming!='' && this.searchForm.yunyingxingming!=undefined){
            params['yunyingxingming'] = '%' + this.searchForm.yunyingxingming + '%'
          }
      this.$http({
        url: "yunyingshangguan/page",
        method: "get",
        params: params
      }).then(({ data }) => {
        if (data && data.code === 0) {
          this.dataList = data.data.list;
          this.totalPage = data.data.total;
        } else {
          this.dataList = [];
          this.totalPage = 0;
        }
        this.dataListLoading = false;
      });
    },
    // 每页数
    sizeChangeHandle(val) {
      this.pageSize = val;
      this.pageIndex = 1;
      this.getDataList();
    },
    // 当前页
    currentChangeHandle(val) {
      this.pageIndex = val;
      this.getDataList();
    },
    // 多选
    selectionChangeHandler(val) {
      this.dataListSelections = val;
    },
    // 添加/修改
    addOrUpdateHandler(id,type) {
      this.showFlag = false;
      this.addOrUpdateFlag = true;
      this.crossAddOrUpdateFlag = false;
      if(type!='info'){
        type = 'else';
      }
      this.$nextTick(() => {
        this.$refs.addOrUpdate.init(id,type);
      });
    },
    // 下载
    download(file){
      window.open(`${file}`)
    },
    // 删除
    deleteHandler(id) {
      var ids = id
        ? [Number(id)]
        : this.dataListSelections.map(item => {
            return Number(item.id);
          });
      this.$confirm(`确定进行[${id ? "删除" : "批量删除"}]操作?`, "提示", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.$http({
          url: "yunyingshangguan/delete",
          method: "post",
          data: ids
        }).then(({ data }) => {
          if (data && data.code === 0) {
            this.$message({
              message: "操作成功",
              type: "success",
              duration: 1500,
              onClose: () => {
                this.search();
              }
            });
          } else {
            this.$message.error(data.msg);
          }
        });
      });
    },


  }

};
</script>
<style lang="scss" scoped>
	
	.center-form-pv {
	  .el-date-editor.el-input {
	    width: auto;
	  }
	}
	
	.el-input {
	  width: auto;
	}
	
	// form
	.center-form-pv .el-input /deep/ .el-input__inner {
				border: 4px double #648fad;
				border-radius: 0;
				padding: 0 20px;
				box-shadow: 0px 0px 0px #ccc;
				outline: none;
				color: #999;
				background: rgba(255,255,255,.1);
				width: 191px;
				font-size: 14px;
				height: 44px;
			}
	
	.center-form-pv .el-select /deep/ .el-input__inner {
				border: 4px double #648fad;
				border-radius: 0px;
				padding: 0 20px;
				box-shadow: 0px 0px 0px #ccc;
				outline: none;
				color: #999;
				background: rgba(255,255,255,.1);
				width: 191px;
				font-size: 14px;
				height: 44px;
			}
	
	.center-form-pv .el-date-editor /deep/ .el-input__inner {
				border: 4px double #648fad;
				border-radius: 0px;
				padding: 0 10px 0 30px;
				box-shadow: 0px 0px 0px #ccc;
				outline: none;
				color: #999;
				background: rgba(255,255,255,.1);
				width: 191px;
				font-size: 14px;
				height: 44px;
			}
	
	// table
	.el-table /deep/ .el-table__header-wrapper thead {
				color: #999;
				font-weight: 500;
				width: 100%;
			}
	
	.el-table /deep/ .el-table__header-wrapper thead tr {
				background: #fff;
			}
	
	.el-table /deep/ .el-table__header-wrapper thead tr th {
				padding: 10px;
				color: #fff;
				background: linear-gradient(0deg, rgba(47,92,125,1) 0%, rgba(10,19,50,1) 100%);
				border-color: #3c769b;
				border-width: 0 0px 1px 0;
				border-style: solid;
				text-align: left;
			}

	.el-table /deep/ .el-table__header-wrapper thead tr th .cell {
				padding: 0 10px;
				word-wrap: normal;
				word-break: break-all;
				white-space: normal;
				font-weight: bold;
				display: inline-block;
				vertical-align: middle;
				width: 100%;
				line-height: 24px;
				position: relative;
				text-overflow: ellipsis;
			}

	
	.el-table /deep/ .el-table__body-wrapper tbody {
				border: 0;
				width: 100%;
			}

	.el-table /deep/ .el-table__body-wrapper tbody tr {
				border: 0;
				background: none;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td {
				padding: 12px 0;
				color: #eee;
				background: none;
				border-color: #3c769b;
				border-width: 0 1px 1px 0;
				border-style: dashed;
				text-align: left;
			}
	
		.el-table /deep/ .el-table__body-wrapper tbody tr.el-table__row--striped td {
		background: rgba(54,97,129,.6);
	}
		
	.el-table /deep/ .el-table__body-wrapper tbody tr:hover td {
				padding: 12px 0;
				color: #fff;
				background: rgba(255,255,255,.2);
				border-color: #3c769b;
				border-width: 0 1px 1px 0;
				border-style: solid;
				text-align: left;
			}
	
	.el-table /deep/ .el-table__body-wrapper tbody tr td {
				padding: 12px 0;
				color: #eee;
				background: none;
				border-color: #3c769b;
				border-width: 0 1px 1px 0;
				border-style: dashed;
				text-align: left;
			}

	.el-table /deep/ .el-table__body-wrapper tbody tr td .cell {
				padding: 0 10px;
				overflow: hidden;
				word-break: break-all;
				white-space: normal;
				line-height: 24px;
				text-overflow: ellipsis;
			}
	
	// pagination
	.main-content .el-pagination /deep/ .el-pagination__total {
				margin: 0 10px 0 0;
				color: #bbb;
				font-weight: 400;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
			}
	
	.main-content .el-pagination /deep/ .btn-prev {
				border: 1px solid #999;
				border-radius: 0px;
				padding: 0;
				margin: 0 5px;
				color: #bbb;
				background: rgba(255,255,255,.1);
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				min-width: 35px;
			}
	
	.main-content .el-pagination /deep/ .btn-next {
				border: 1px solid #999;
				border-radius: 0px;
				padding: 0;
				margin: 0 5px;
				color: #bbb;
				background: rgba(255,255,255,.1);
				display: inline-block;
				vertical-align: top;
				line-height: 28px;
				min-width: 35px;
			}
	
	.main-content .el-pagination /deep/ .btn-prev:disabled {
				border: 1px solid #999;
				cursor: not-allowed;
				border-radius: 0px;
				padding: 0;
				margin: 0 5px;
				color: #bbb;
				background: rgba(255,255,255,.1);
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
			}
	
	.main-content .el-pagination /deep/ .btn-next:disabled {
				border: 1px solid #999;
				cursor: not-allowed;
				border-radius: 0px;
				padding: 0;
				margin: 0 5px;
				color: #bbb;
				background: rgba(255,255,255,.1);
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
			}

	.main-content .el-pagination /deep/ .el-pager {
				padding: 0;
				margin: 0;
				display: inline-block;
				vertical-align: top;
			}

	.main-content .el-pagination /deep/ .el-pager .number {
				cursor: pointer;
				border: 1px solid #999;
				border-radius: 0px;
				padding: 0 4px;
				margin: 0 5px;
				color: #bbb;
				background: rgba(255,255,255,.1);
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				text-align: center;
				min-width: 30px;
			}
	
	.main-content .el-pagination /deep/ .el-pager .number:hover {
				cursor: pointer;
				border: 0;
				border-radius: 0px;
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				background: rgba(23,165,255,.5);
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				text-align: center;
				min-width: 30px;
			}
	
	.main-content .el-pagination /deep/ .el-pager .number.active {
				cursor: default;
				border-radius: 0px;
				padding: 0 4px;
				margin: 0 5px;
				color: #fff;
				background: rgba(23,165,255,.5);
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
				text-align: center;
				min-width: 30px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes {
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input {
				margin: 0 5px;
				width: 100px;
				position: relative;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__inner {
				border: 1px solid #999;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 25px 0 8px;
				outline: 0;
				color: #bbb;
				background: rgba(255,255,255,.1);
				display: inline-block;
				width: 100%;
				font-size: 13px;
				text-align: center;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input span.el-input__suffix {
				top: 0;
				position: absolute;
				right: 0;
				height: 100%;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__sizes .el-input .el-input__suffix .el-select__caret {
				cursor: pointer;
				color: #bbb;
				width: 25px;
				font-size: 14px;
				text-align: center;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__jump {
				margin: 0 0 0 24px;
				color: #bbb;
				display: inline-block;
				vertical-align: top;
				font-size: 13px;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__jump .el-input {
				border-radius: 3px;
				padding: 0 2px;
				margin: 0 2px;
				display: inline-block;
				width: 50px;
				font-size: 14px;
				position: relative;
				text-align: center;
			}
	
	.main-content .el-pagination /deep/ .el-pagination__jump .el-input .el-input__inner {
				border: 1px solid #999;
				cursor: pointer;
				border-radius: 0px;
				padding: 0 3px;
				outline: 0;
				color: #bbb;
				background: rgba(255,255,255,.1);
				display: inline-block;
				width: 100%;
				font-size: 14px;
				text-align: center;
			}
</style>
