import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { TouchableOpacity } from 'react-native-gesture-handler'

const Tasks = (props) => {
  return (
    <View style={styles.item}>
        <View style={styles.itemLeft}>
            <View style={styles.square}></View>
            <Text style={styles.itemText}>{props.text}</Text>
        </View>
<View style={styles.circular}></View>
    </View>
  )
}

export default Tasks

const styles = StyleSheet.create({
    item:{
        backgroundColor:'#fff',
        padding:15,
        borderRadius:10,
        flexDirection:'row',
        alignItems:'center',
        justifyContent:'space-between',
        marginBottom:20,
        shadowColor:'#232',
        shadowOpacity:0.4,
        shadowOffset:{width:3, height:3}
    },
    itemLeft:{
        flexDirection:'row',
        alignItems:'center',
        flexWrap:'wrap'
    },
    square:{
        width:24,
        height:24,
        backgroundColor:'#55bcf6',
        opacity:0.4,
        borderRadius:5,
    },
    itemText:{
        maxWidth:"80%",

    },
    circular:{
        width:12,
        height:12,
        borderColor:"#55bcf6",
        borderRadius:5,
        borderWidth:2,
        

    },
})