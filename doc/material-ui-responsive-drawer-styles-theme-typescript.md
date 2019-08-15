# material-ui responsive drawer with styles and theme ( typescript )

*[webdevel](../README.md#webdevel)*

adjusted from https://material-ui.com/demos/drawers/

```ts
import React from 'react';
import PropTypes from 'prop-types';
import AppBar from '@material-ui/core/AppBar';
import CssBaseline from '@material-ui/core/CssBaseline';
import Divider from '@material-ui/core/Divider';
import Drawer from '@material-ui/core/Drawer';
import Hidden from '@material-ui/core/Hidden';
import IconButton from '@material-ui/core/IconButton';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import ListItemIcon from '@material-ui/core/ListItemIcon';
import ListItemText from '@material-ui/core/ListItemText';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import { withStyles, Theme, createStyles, WithStyles } from '@material-ui/core/styles';
import { MdInbox, MdMail, MdMenu } from 'react-icons/md';

const drawerWidth = 240;

const styles = (theme: Theme) => createStyles({
    root: {
        display: 'flex',
    },
    drawer: {
        [theme.breakpoints.up('sm')]: {
            width: drawerWidth,
            flexShrink: 0,
        },
    },
    appBar: {
        marginLeft: drawerWidth,
        [theme.breakpoints.up('sm')]: {
            width: `calc(100% - ${drawerWidth}px)`,
        },
    },
    menuButton: {
        marginRight: 20,
        [theme.breakpoints.up('sm')]: {
            display: 'none',
        },
    },
    toolbar: theme.mixins.toolbar,
    drawerPaper: {
        width: drawerWidth,
    },
    content: {
        flexGrow: 1,
        padding: theme.spacing.unit * 3,
    },
});
type withStyleProps = keyof ReturnType<typeof styles>

interface IState {
    mobileOpen: boolean
}

interface IProps {
    theme: Theme
}

const ResponsiveDrawer = withStyles(styles, { withTheme: true })(
    class extends React.Component<WithStyles<withStyleProps> & IProps, IState> {
        state = {
            mobileOpen: false,
        };

        handleDrawerToggle = () => {
            this.setState(state => ({ mobileOpen: !state.mobileOpen }));
        };

        render() {

            const classes = this.props.classes
            const theme = this.props.theme

            const drawer = (
                <div>
                    <div className={classes.toolbar} />
                    <Divider />
                    <List>
                        {['Inbox', 'Starred', 'Send email', 'Drafts'].map((text, index) => (
                            <ListItem button key={text}>
                                <ListItemIcon>{index % 2 === 0 ? <MdInbox /> : <MdMail />}</ListItemIcon>
                                <ListItemText primary={text} />
                            </ListItem>
                        ))}
                    </List>
                    <Divider />
                    <List>
                        {['All mail', 'Trash', 'Spam'].map((text, index) => (
                            <ListItem button key={text}>
                                <ListItemIcon>{index % 2 === 0 ? <MdInbox /> : <MdMail />}</ListItemIcon>
                                <ListItemText primary={text} />
                            </ListItem>
                        ))}
                    </List>
                </div>
            );

            return (
                <div className={classes.root}>
                    <CssBaseline />
                    <AppBar position="fixed" className={classes.appBar}>
                        <Toolbar>
                            <IconButton
                                color="inherit"
                                aria-label="Open drawer"
                                onClick={this.handleDrawerToggle}
                                className={classes.menuButton}
                            >
                                <MdMenu />
                            </IconButton>
                            <Typography variant="h6" color="inherit" noWrap>
                                Responsive drawer
                            </Typography>
                        </Toolbar>
                    </AppBar>
                    <nav className={classes.drawer}>
                        {/* The implementation can be swapped with js to avoid SEO duplication of links. */}
                        <Hidden smUp implementation="css">
                            <Drawer                                
                                variant="temporary"
                                anchor={theme.direction === 'rtl' ? 'right' : 'left'}
                                open={this.state.mobileOpen}
                                onClose={this.handleDrawerToggle}
                                classes={{
                                    paper: classes.drawerPaper,
                                }}
                            >
                                {drawer}
                            </Drawer>
                        </Hidden>
                        <Hidden xsDown implementation="css">
                            <Drawer
                                classes={{
                                    paper: classes.drawerPaper,
                                }}
                                variant="permanent"
                                open
                            >
                                {drawer}
                            </Drawer>
                        </Hidden>
                    </nav>
                    <main className={classes.content}>
                        <div className={classes.toolbar} />
                        <Typography paragraph>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                            incididunt ut labore et dolore magna aliqua. Rhoncus dolor purus non enim praesent
                            elementum facilisis leo vel. Risus at ultrices mi tempus imperdiet. Semper risus in
                            hendrerit gravida rutrum quisque non tellus. Convallis convallis tellus id interdum
                            velit laoreet id donec ultrices. Odio morbi quis commodo odio aenean sed adipiscing.
                            Amet nisl suscipit adipiscing bibendum est ultricies integer quis. Cursus euismod quis
                            viverra nibh cras. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo.
                            Mauris commodo quis imperdiet massa tincidunt. Cras tincidunt lobortis feugiat vivamus
                            at augue. At augue eget arcu dictum varius duis at consectetur lorem. Velit sed
                            ullamcorper morbi tincidunt. Lorem donec massa sapien faucibus et molestie ac.
                        </Typography>
                        <Typography paragraph>
                            Consequat mauris nunc congue nisi vitae suscipit. Fringilla est ullamcorper eget nulla
                            facilisi etiam dignissim diam. Pulvinar elementum integer enim neque volutpat ac
                            tincidunt. Ornare suspendisse sed nisi lacus sed viverra tellus. Purus sit amet volutpat
                            consequat mauris. Elementum eu facilisis sed odio morbi. Euismod lacinia at quis risus
                            sed vulputate odio. Morbi tincidunt ornare massa eget egestas purus viverra accumsan in.
                            In hendrerit gravida rutrum quisque non tellus orci ac. Pellentesque nec nam aliquam sem
                            et tortor. Habitant morbi tristique senectus et. Adipiscing elit duis tristique
                            sollicitudin nibh sit. Ornare aenean euismod elementum nisi quis eleifend. Commodo
                            viverra maecenas accumsan lacus vel facilisis. Nulla posuere sollicitudin aliquam
                            ultrices sagittis orci a.
          </Typography>
                    </main>
                </div>
            );
        }
    })

/*
ResponsiveDrawer.propTypes = {
  classes: PropTypes.object.isRequired,
  // Injected by the documentation to work in an iframe.
  // You won't need it on your project.
  container: PropTypes.object,
  theme: PropTypes.object.isRequired,
};*/

export default ResponsiveDrawer
```
