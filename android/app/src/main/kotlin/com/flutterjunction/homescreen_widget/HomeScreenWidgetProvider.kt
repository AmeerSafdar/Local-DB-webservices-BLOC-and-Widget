package com.flutterjunction.homescreen_widget  // your package name

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.net.Uri
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetBackgroundIntent
import es.antonborri.home_widget.HomeWidgetLaunchIntent
import es.antonborri.home_widget.HomeWidgetProvider

class HomeScreenWidgetProvider : HomeWidgetProvider() {
      override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.widget_layout).apply {
                // Open App on Widget Click
                val pendingIntent = HomeWidgetLaunchIntent.getActivity(
                        context,
                        MainActivity::class.java)
              
                val lname0 = widgetData.getString("lname0", "")
                val lname1 = widgetData.getString("lname1", "")
                val lname2 = widgetData.getString("lname2", "")
                val lname3 = widgetData.getString("lname3", "")
                val lname4 = widgetData.getString("lname4", "")
                val lname5 = widgetData.getString("lname5", "")

                setTextViewText(R.id.lname0,lname0)
                setTextViewText(R.id.lname1,lname1)
                setTextViewText(R.id.lname2,lname2)
                setTextViewText(R.id.lname3,lname3)
                setTextViewText(R.id.lname4,lname4)
                setTextViewText(R.id.lname5,lname5)
                
                val backgroundIntent = HomeWidgetBackgroundIntent.getBroadcast(context,
                        Uri.parse("myAppWidget://updatecounter"))
                setOnClickPendingIntent(R.id.widget_root, backgroundIntent)
            }

            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}