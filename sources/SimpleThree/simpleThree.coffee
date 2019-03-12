import THREE, { Renderer as THREE_Render } from './Render'

drawProgram = ({
  gl
  width
  height
}) =>
  await do =>

  scene = new THREE.Scene()

  camera = new THREE.PerspectiveCamera(
    75
    width / height
    0.1
    1000
  )

  renderer = new THREE_Render {
    gl
  }

  renderer.setSize width, height
  renderer.setClearColor 0xeeeeee

  geometry = new THREE.BoxGeometry 1, 1, 1
  material = new THREE.MeshBasicMaterial
    transparent: true
    color: 0x00ff00
  cube = new THREE.Mesh geometry, material

  scene.add cube

  camera.position.z = 3

  onTick: =>

    cube.rotation.x += 0.04
    cube.rotation.y += 0.07

    renderer.render scene, camera

    gl.endFrameEXP()

export default ({
  gl
  width
  height
}) =>

  try
    await drawProgram {
      gl
      width
      height
    }
  catch e
    console.log e
