import { createMuiTheme } from '@material-ui/core';
import { blue, common, grey, lightGreen, red } from '@material-ui/core/colors';

const theme = createMuiTheme(
  {
    typography: {
      allVariants: {
        color:'#ff443a'
      }
    },
    overrides: {
      MuiPaper: {
        elevation1: {
          backgroundColor: '#1c1c1e',
          background: '#1c1c1e',
          color:'#ff443a'
        }
      },
      MuiInput: {
        root: {
          border: "none",
          color:'#ff443a'
        },
        focused: {
          border: "none",
        }
      }
    }
  }
);

export default theme;
