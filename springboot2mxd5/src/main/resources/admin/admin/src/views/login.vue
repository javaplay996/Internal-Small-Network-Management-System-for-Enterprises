<template>
  <div>
    <div class="container" :style='{"minHeight":"100vh","alignItems":"center","background":"url(http://codegen.caihongy.cn/20221201/760046d0cca14ba09053b57a5cd9d3af.jpg)","display":"flex","width":"100%","backgroundSize":"100% 100%","backgroundPosition":"center center","backgroundRepeat":"no-repeat","justifyContent":"center"}'>

      <el-form :style='{"minHeight":"853px","padding":"40px 0px 60px 0px","margin":"40px auto 0 auto","borderRadius":"4px","background":"url(http://codegen.caihongy.cn/20221201/39914ca6890e4a7eb7035a0f85f78ca2.png) no-repeat center top","width":"850px","backgroundSize":"auto 100%","height":"auto"}'>
        <div v-if="true" :style='{"width":"100%","margin":"150px 0px 30px 0px","lineHeight":"44px","fontSize":"24px","color":"#fff","textAlign":"center"}' class="title-container">企业内部小型网络管理系统的设计与实现登录</div>
        <div class="list-item" :style='{"width":"80%","margin":"0 auto 40px 220px","alignItems":"center","flexWrap":"wrap","display":"flex"}'>
          <div v-if="false" class="lable" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"#160f53"}'>用户名</div>
          <input :style='{"padding":"0 10px","borderColor":"#d0cddb","color":"#ccc","borderRadius":"20px","borderWidth":"1px","background":"none","width":"360px","fontSize":"14px","borderStyle":"solid","height":"40px"}' placeholder="请输入用户名" name="username" type="text" v-model="rulesForm.username">
        </div>
        <div class="list-item" :style='{"width":"80%","margin":"0 auto 40px 220px","alignItems":"center","flexWrap":"wrap","display":"flex"}'>
          <div v-if="false" class="lable" :style='{"width":"64px","lineHeight":"44px","fontSize":"14px","color":"#160f53"}'>密码：</div>
          <input :style='{"padding":"0 10px","borderColor":"#d0cddb","color":"#ccc","borderRadius":"20px","borderWidth":"1px","background":"none","width":"360px","fontSize":"14px","borderStyle":"solid","height":"40px"}' placeholder="请输入密码" name="password" type="password" v-model="rulesForm.password">
        </div>
        <div class="list-code" v-if="true" :style='{"width":"80%","margin":"20px auto","alignItems":"center","flexWrap":"wrap","display":"flex"}'>
          <input :style='{"padding":"0 20px","outline":"none","margin":"0 10px 0 136px","borderColor":"#d0cddb","color":"#ccc","borderRadius":"20px","borderWidth":"1px","background":"none","width":"270px","fontSize":"14px","borderStyle":"solid","height":"40px"}' placeholder="请输入验证码" name="code" type="text" v-model="rulesForm.code">
          <div class="getCodeBt" :style='{"cursor":"pointer","borderColor":"#d0cddb","alignItems":"center","borderRadius":"20px","borderWidth":"1px","background":"#fff","display":"flex","width":"80px","borderStyle":"solid","justifyContent":"center","height":"40px"}' @click="getRandCode(4)">
            <span :style="{color:item.color,transform:item.rotate,fontSize:item.size,padding: '0 3px',display:'inline-block'}" v-for="(item, index) in codes" :key="index">{{ item.num }}</span>
          </div>
        </div>
        <div :style='{"width":"80%","margin":"40px auto 0 220px"}' v-if="roles.length>1" prop="loginInRole" class="list-type">
          <el-radio v-for="item in roles" v-bind:key="item.roleName" v-model="rulesForm.role" :label="item.roleName">{{item.roleName}}</el-radio>
        </div>
        <div :style='{"width":"550px","margin":"30px auto 0 auto","alignItems":"center","flexWrap":"wrap","justifyContent":"center","display":"flex"}'>
          <el-button :style='{"border":"0","cursor":"pointer","padding":"0 20px","margin":"0 5px","outline":"none","color":"#fff","borderRadius":"20px","background":"#17a5ff","width":"auto","fontSize":"14px","height":"40px"}' type="primary" @click="login()" class="loginInBt">登录</el-button>
          <el-button :style='{"border":"1px solid #17a5ff","cursor":"pointer","padding":"0 10px","margin":"0 5px","outline":"none","color":"#17a5ff","borderRadius":"20px","background":"#fff","width":"auto","fontSize":"14px","height":"40px"}' type="primary" @click="register('yonghu')" class="register">注册用户</el-button>
        </div>
      </el-form>

    </div>
  </div>
</template>
<script>

import menu from "@/utils/menu";

export default {
  data() {
    return {
      rulesForm: {
        username: "",
        password: "",
        role: "",
        code: '',
      },
      menus: [],
      roles: [],
      tableName: "",
      codes: [{
        num: 1,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 2,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 3,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      },{
        num: 4,
        color: '#000',
        rotate: '10deg',
        size: '16px'
      }],
    };
  },
  mounted() {
    let menus = menu.list();
    this.menus = menus;

    for (let i = 0; i < this.menus.length; i++) {
      if (this.menus[i].hasBackLogin=='是') {
        this.roles.push(this.menus[i])
      }
    }

  },
  created() {
    this.getRandCode()
  },
  destroyed() {
	    },
  methods: {

    //注册
    register(tableName){
		this.$storage.set("loginTable", tableName);
        this.$storage.set("pageFlag", "register");
		this.$router.push({path:'/register'})
    },
    // 登陆
    login() {
		let code = ''
		for(let i in this.codes) {
			code += this.codes[i].num
		}
		if ('true' && !this.rulesForm.code) {
			this.$message.error("请输入验证码");
			return;
		}
		if ('true' && this.rulesForm.code.toLowerCase() != code.toLowerCase()) {
			this.$message.error("验证码输入有误");
			this.getRandCode()
			return;
		}

		if (!this.rulesForm.username) {
			this.$message.error("请输入用户名");
			return;
		}
		if (!this.rulesForm.password) {
			this.$message.error("请输入密码");
			return;
		}
		if(this.roles.length>1) {
			if (!this.rulesForm.role) {
				this.$message.error("请选择角色");
				return;
			}

			let menus = this.menus;
			for (let i = 0; i < menus.length; i++) {
				if (menus[i].roleName == this.rulesForm.role) {
					this.tableName = menus[i].tableName;
				}
			}
		} else {
			this.tableName = this.roles[0].tableName;
			this.rulesForm.role = this.roles[0].roleName;
		}

		this.$http({
			url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
			method: "post"
		}).then(({ data }) => {
			if (data && data.code === 0) {
				this.$storage.set("Token", data.token);
				this.$storage.set("role", this.rulesForm.role);
				this.$storage.set("sessionTable", this.tableName);
				this.$storage.set("adminName", this.rulesForm.username);
				this.$router.replace({ path: "/index/" });
			} else {
				this.$message.error(data.msg);
			}
		});
    },
    getRandCode(len = 4){
		this.randomString(len)
    },
    randomString(len = 4) {
      let chars = [
          "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k",
          "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
          "w", "x", "y", "z", "A", "B", "C", "D", "E", "F", "G",
          "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R",
          "S", "T", "U", "V", "W", "X", "Y", "Z", "0", "1", "2",
          "3", "4", "5", "6", "7", "8", "9"
      ]
      let colors = ["0", "1", "2","3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
      let sizes = ['14', '15', '16', '17', '18']

      let output = [];
      for (let i = 0; i < len; i++) {
        // 随机验证码
        let key = Math.floor(Math.random()*chars.length)
        this.codes[i].num = chars[key]
        // 随机验证码颜色
        let code = '#'
        for (let j = 0; j < 6; j++) {
          let key = Math.floor(Math.random()*colors.length)
          code += colors[key]
        }
        this.codes[i].color = code
        // 随机验证码方向
        let rotate = Math.floor(Math.random()*60)
        let plus = Math.floor(Math.random()*2)
        if(plus == 1) rotate = '-'+rotate
        this.codes[i].rotate = 'rotate('+rotate+'deg)'
        // 随机验证码字体大小
        let size = Math.floor(Math.random()*sizes.length)
        this.codes[i].size = sizes[size]+'px'
      }
    },
  }
};
</script>

<style lang="scss" scoped>
.container {
  min-height: 100vh;
  position: relative;
  background-repeat: no-repeat;
  background-position: center center;
  background-size: cover;
      background: url(http://codegen.caihongy.cn/20221201/760046d0cca14ba09053b57a5cd9d3af.jpg);
        
  .list-item /deep/ .el-input .el-input__inner {
		border-radius: 20px;
		padding: 0 10px;
		color: #ccc;
		background: none;
		width: 360px;
		font-size: 14px;
		border-color: #d0cddb;
		border-width: 1px;
		border-style: solid;
		height: 40px;
	  }
  
  .list-code /deep/ .el-input .el-input__inner {
  	  	border-radius: 20px;
  	  	padding: 0 20px;
  	  	outline: none;
  	  	margin: 0 10px 0 136px;
  	  	color: #ccc;
  	  	background: none;
  	  	width: 270px;
  	  	font-size: 14px;
  	  	border-color: #d0cddb;
  	  	border-width: 1px;
  	  	border-style: solid;
  	  	height: 40px;
  	  }

  .list-type /deep/ .el-radio__input .el-radio__inner {
		background: rgba(53, 53, 53, 0);
		border-color: #666666;
	  }
  .list-type /deep/ .el-radio__input.is-checked .el-radio__inner {
        background: #999;
        border-color: #ddd;
      }
  .list-type /deep/ .el-radio__label {
		color: #999;
		font-size: 14px;
	  }
  .list-type /deep/ .el-radio__input.is-checked+.el-radio__label {
        color: #ccc;
        font-size: 14px;
      }
}
</style>
