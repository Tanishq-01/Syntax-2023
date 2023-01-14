import React from 'react';

const ram = () => {
  const containerStyles = {
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    margin: '50px 0',
    backgroundColor: 'black' 
  }

  const imageStyles = {
    width: '200px',
    height: '200px',
    borderRadius: '50%',
    marginBottom: '20px'
  }

  const textStyles = {
    textAlign: 'center',
    fontSize: '24px',
    marginBottom: '20px',
    fontColor: '#40E0D0',
    backgroundColor:'black',
    fontfamily:'Serif'
  }

  const bioStyles = {
    textAlign: 'center',
    fontSize: '18px',
    lineHeight: '1.6',
    backgroundColor: 'black'
  }

  const boxStyles = {
    width: '30%',
    height: '150px',
    margin: '20px',
    padding: '20px',
    boxSizing: 'border-box',
    display: 'flex',
    flexDirection: 'column',
    alignItems: 'center',
    justifyContent: 'center',
    borderRadius: '25px',
    backgroundColor: 'white',
    boxShadow: '0px 2px 5px #ccc'
  }

  const boxTitleStyles = {
    fontSize: '20px',
    marginBottom: '10px'
  }

  const boxTextStyles = {
    fontSize: '25px',
    backgroundColor:'black'
  }

  return (
    <div>
      <div style={containerStyles}>
        <img style={imageStyles} src="teacher.jpg" alt="Teacher" />
        <h1 style={textStyles}>Meet Your Teacher</h1>
        <p style={bioStyles}>My name is Ram Gupta and I am an experienced Maths teacher. I have a passion for teaching and helping students understand the complexities of the natural world. I have been teaching for over 10 years and have a proven track record of helping students achieve their goals and excel in their studies. I look forward to working with you and helping you succeed!</p>
      </div>
      <div style={{ display: 'flex', justifyContent: 'center' }}>
        <div style={boxStyles}>
          <h2 style={boxTitleStyles}>Experience</h2>
          <p style={boxTextStyles}>Polynomials</p>
        </div>
        <div style={boxStyles}>
          <h2 style={boxTitleStyles}>Education</h2>
          <p style={boxTextStyles}>Vector Algebra</p>
        </div>
        <div style={boxStyles}>
          <h2 style={boxTitleStyles}>Awards</h2>
          <p style={boxTextStyles}>Arithmetic Progressions</p>
          </div>
          </div>
</div>)}

export default ram