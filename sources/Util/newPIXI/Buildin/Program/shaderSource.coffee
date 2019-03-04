Vertex = """
  // 一个属性变量，将会从缓冲中获取数据
  // attribute vec4 a_position;
  attribute vec2 a_position;
  uniform vec2 u_resolution;

  // 所有着色器都有一个main方法
  void main() {

    // 从像素坐标转换到 0.0 到 1.0
    vec2 zeroToOne = a_position / u_resolution;

    // 再把 0->1 转换 0->2
    vec2 zeroToTwo = zeroToOne * 2.0;

    // 把 0->2 转换到 -1->+1 (裁剪空间)
    vec2 clipSpace = zeroToTwo - 1.0;

    // gl_Position 是一个顶点着色器主要设置的变量
    // gl_Position = a_position;

    // gl_Position = vec4(clipSpace, 0, 1);
    // WebGL认为左下角是 0，0 。 想要像传统二维API那样起点在左上角，我们只需翻转y轴即可

    gl_Position = vec4(clipSpace * vec2(1, -1), 0, 1);
  }
"""
# """
#   // 一个属性变量，将会从缓冲中获取数据
#   attribute vec4 a_position;

#   // 所有着色器都有一个main方法
#   void main() {

#     // gl_Position 是一个顶点着色器主要设置的变量
#     gl_Position = a_position;
#   }
# """

Fragment = """
  // 片断着色器没有默认精度，所以我们需要设置一个精度
  // mediump是一个不错的默认值，代表“medium precision”（中等精度）
  precision mediump float;

  void main() {
    // gl_FragColor是一个片断着色器主要设置的变量
    gl_FragColor = vec4(1, 0, 0.5, 1); // 返回“瑞迪施紫色”
  }
"""

export  {
  Vertex
  Fragment
}
