/*
 * Cerberus  Copyright (C) 2013  vertigo17
 * DO NOT ALTER OR REMOVE COPYRIGHT NOTICES OR THIS FILE HEADER.
 *
 * This file is part of Cerberus.
 *
 * Cerberus is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * Cerberus is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with Cerberus.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.cerberus.servlet.zzpublic;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.cerberus.crud.dao.ITestCaseCountryDAO;
import org.cerberus.dto.ExecutionValidator;
import org.cerberus.dto.service.IExecutionValidatorService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

/**
 *
 * @author cerberus
 */
@WebServlet(name = "GetExecutionQueue", urlPatterns = {"/GetExecutionQueue"})
public class GetExecutionQueue extends HttpServlet {

    private ITestCaseCountryDAO testCaseCountryDAO;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws org.json.JSONException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, JSONException {
        ApplicationContext appContext = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());

        IExecutionValidatorService execValidatorService = appContext.getBean(IExecutionValidatorService.class);

        JSONArray testCaseList = new JSONArray(request.getParameter("testcase"));
        JSONArray environmentList = new JSONArray(request.getParameter("environment"));
        JSONArray countryList = new JSONArray(request.getParameter("countries"));
        List<ExecutionValidator> inQueue = new ArrayList<ExecutionValidator>();

        for (int iterTC = 0; iterTC < testCaseList.length(); iterTC++) {
            JSONObject testCase = testCaseList.getJSONObject(iterTC);

            for (int iterEnv = 0; iterEnv < environmentList.length(); iterEnv++) {
                JSONObject env = environmentList.getJSONObject(iterEnv);

                for (int iterCountry = 0; iterCountry < countryList.length(); iterCountry++) {
                    String Country = countryList.getString(iterCountry);

                    ExecutionValidator toAdd = new ExecutionValidator();

                    toAdd.setTest(testCase.getString("test"));
                    toAdd.setTestCase(testCase.getString("testcase"));
                    toAdd.setApplication(testCase.getString("application"));
                    toAdd.setCountry(Country);
                    toAdd.setEnvironment(env.getString("env"));

                    execValidatorService.validateExecution(toAdd);
                    inQueue.add(toAdd);
                }
            }
        }

        JSONArray answer = new JSONArray();
        for (ExecutionValidator tce : inQueue) {
            JSONObject exec = new JSONObject();

            exec.put("test", tce.getTest());
            exec.put("testcase", tce.getTestCase());
            exec.put("env", tce.getEnvironment());
            exec.put("country", tce.getCountry());
            exec.put("isValid", tce.isValid());
            exec.put("message", tce.getMessage());
            answer.put(exec);
        }

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("contentTable", answer);
        response.setContentType("application/json");
        response.getWriter().print(jsonResponse.toString());
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(GetExecutionQueue.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (JSONException ex) {
            Logger.getLogger(GetExecutionQueue.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
